import 'package:bmi_calculator/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseBrain extends StatelessWidget {
  late final String name;
  late final int age;
  late final double previousBMI;

  final PreferredSizeWidget? appBar;
  final Widget? body;

  DatabaseBrain({this.body, this.appBar});

    final String? userID = FirebaseAuth.instance.currentUser?.uid.toString();
  Future<String?> fetchName () async {
    String? name;
    final CollectionReference firestoreInstance =
    FirebaseFirestore.instance.collection('users');
    await firestoreInstance.doc(userID).get().then((event) {
      name = event['name'];
    });
    return name;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> getName() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    String name = data["name"] as String;// check if it null or not
    return name;
  }

  Future<int> getAge() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    Timestamp timestamp = data["dob"] as Timestamp;
    int age = DateTime.now()
        .difference(
        DateTime.parse((timestamp.toDate().toString())))
        .inDays ~/
        365;
    return age;
  }

  Future<double> getPreviousBMI() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    double previousBMI = data["previousBMI"] as double;// check if it null or not
    return previousBMI;
  }

  Future<String> getGender() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    String gender = data["gender"] as String;// check if it null or not
    return gender;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
          future: users.doc(FirebaseAuth.instance.currentUser?.uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              name = data['name'].toString();

              previousBMI =
                  double.parse((data['previousBMI']).toStringAsFixed(1));

              Timestamp timestamp = data['dob'];
              age = DateTime.now()
                      .difference(
                          DateTime.parse((timestamp.toDate().toString())))
                      .inDays ~/
                  365;

              print('name: ${name}, previousBMI: ${previousBMI}, age: ${age}');
              return SelectionPage();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

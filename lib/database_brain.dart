import 'package:bmi_calculator/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseBrain {
  late final String name;
  late final int age;
  late final double previousBMI;

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final String? userID;

  DatabaseBrain({this.body, this.appBar, required this.userID});


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getName() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    String name = data["name"] as String; // check if it null or not
    return name;
  }

  Future<bool> checkAdmin() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    bool admin = data["admin"] as bool; // check if it null or not
    return admin;
  }

  Future<int> getAge() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    Timestamp timestamp = data["dob"] as Timestamp;
    int age = DateTime
        .now()
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
    double previousBMI = data["previousBMI"] as double; // check if it null or not
    return previousBMI;
  }

  Future<String> getGender() async {
    DocumentSnapshot ds =
    await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    String gender = data["gender"] as String; // check if it null or not
    print(userID);
    print(gender);
    return gender;
  }

}
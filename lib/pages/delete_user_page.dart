import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteUserPage extends StatefulWidget {
  @override
  _DeleteUserPageState createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  final _formKey = GlobalKey<FormState>();

  // Add a text controller for the email field
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text('Delete User'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Form(
        key: _formKey,
        child: ReusableCard(
          color: Colors.blueGrey,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(20),
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              ReusableCard(
                color: Color(0xFFB0BEC5),
                padding: EdgeInsets.all(20),
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    // Query the users collection for a document with the matching email
                    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: _emailController.text).get();
                    if (snapshot.docs.length == 0) {
                      // If no documents are found, display an error message
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user was found with the specified email.')));
                    } else {
                      // If a document is found, delete it
                      DocumentSnapshot user = snapshot.docs[0];
                      await user.reference.delete();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The user was deleted successfully.')));
                    }
                  }
                },
                cardChild: Text('Delete User',
                style: kAdminTextStyle,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

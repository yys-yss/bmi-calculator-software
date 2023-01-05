import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import 'package:intl/intl.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();

  // Add text controllers for each of the form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text('Create New User'),
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
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
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
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
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth (YYYY-MM-DD)'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a date of birth';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _selectedGender,
                items: [
                  DropdownMenuItem(
                    child: Text('Male'),
                    value: 'male',
                  ),
                  DropdownMenuItem(
                    child: Text('Female'),
                    value: 'female',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value as String?;
                  });
                },
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              ReusableCard(
                color: Color(0xFFB0BEC5),
                padding: EdgeInsets.all(20),
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    // Parse the date of birth string into a DateTime object
                    var dob = DateFormat("yyyy-MM-dd").parse(_dobController.text);

                    // Create a new user with FirebaseAuth
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    final authResult = await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    // Get the user's UID
                    final uid = authResult.user?.uid;

                    // Add a new document with the user's UID as the document ID
                    await FirebaseFirestore.instance.collection('users').doc(uid).set({
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'password': _passwordController.text,
                      'admin': false,
                      'dob': Timestamp.fromDate(dob),
                      'gender': _selectedGender,
                    });
                    Navigator.pop(context);
                  }
                },
                cardChild: Text(
                  'Create User',
                  style: kAdminTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

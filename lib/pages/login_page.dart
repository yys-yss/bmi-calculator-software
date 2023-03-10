import 'package:bmi_calculator/pages/bmi_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';
import 'package:bmi_calculator/database_brain.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    Future signIn() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Check the user's role and navigate to the appropriate page
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        print(e);
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          Navigator.pop(context);
          return QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Incorrect Email/Password',
            text: 'Please enter your correct user details',
            backgroundColor: kInactiveCardColor,
            titleColor: Colors.white,
            textColor: Colors.white,
            confirmBtnColor: kBottomContainerColor,
            confirmBtnText: 'OK',
          );
        } else if (e.code == 'invalid-email' || e.code == 'unknown') {
          Navigator.pop(context);
          return QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Invalid Email',
            text: 'Please enter a valid email address',
            backgroundColor: kInactiveCardColor,
            titleColor: Colors.white,
            textColor: Colors.white,
            confirmBtnColor: kBottomContainerColor,
            confirmBtnText: 'OK',
          );
        }
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableCard(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(5),
                    color: Colors.transparent,
                    cardChild: Column(
                      children: [
                        Container(
                          child: Image.asset('assets/images/logo_foreground.png',
                          scale: 0.5,),
                        ),
                        Text(
                          'Welcome back',
                          style: kResultTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Please enter your credentials',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextField(
                            controller: _emailController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              labelStyle: kLabelTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextField(
                            obscureText: true,
                            controller: _passwordController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: kLabelTextStyle,
                            ),
                          ),
                        ),

                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kBottomContainerColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

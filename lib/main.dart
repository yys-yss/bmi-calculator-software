import 'package:bmi_calculator/pages/admin_page.dart';
import 'package:bmi_calculator/pages/selection_page.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Testing branch stuff
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthWidget());
}

final navigatorKey = GlobalKey<NavigatorState>();

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Get the user's document from the users collection
            final uid = snapshot.data?.uid;
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
              builder: (context, userSnapshot) {
                if (userSnapshot.hasData) {
                  // Check the value of the admin field
                  if (userSnapshot.data!['admin']) {
                    return AdminPage();
                  } else {
                    return Routes();
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            );
          } else {
            return LoginPage();
          }
        },
      ),
    ),
  );
}

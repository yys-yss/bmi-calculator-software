import 'package:bmi_calculator/pages/add_user_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';
import 'delete_user_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          FirebaseAuth.instance.signOut();
          return false;
        },
        child: MaterialApp(
          theme: kAdminTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text('ADMIN VIEW'),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: Colors.blueGrey,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddUserPage(),
                          ),
                        );
                      },
                      cardChild: Center(
                        child: Text(
                          'ADD USER',
                          style: kSelectionTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeleteUserPage(),
                          ),
                        );
                      },
                      color: Colors.blueGrey,
                      cardChild: Center(
                        child: Text(
                          'DELETE USER',
                          style: kSelectionTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

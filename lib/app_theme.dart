import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';



class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF230C33)),
        scaffoldBackgroundColor: Color(0xFF230C33),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      routes: {
        '/': (context) => InputPage(),
      },
      initialRoute: '/',
    );
  }
}

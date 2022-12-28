import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/offline_mode.dart';
import 'package:flutter/material.dart';
import 'selection_page.dart';
import 'bmi_calculator.dart';


class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      routes: {
        '/': (context) => SelectionPage(),
        '/bmiCalculator': (context) => BMICalculator(),
        '/offlineMode': (context) => OfflineMode(),
      },
      initialRoute: '/',
    );
  }
}


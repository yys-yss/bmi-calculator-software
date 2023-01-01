import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/offline_mode.dart';
import 'package:flutter/material.dart';
import 'pages/selection_page.dart';
import 'pages/bmi_calculator.dart';
import 'pages/body_fat_calculator.dart';
import 'database_brain.dart';


class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      routes: {
        '/': (context) => DatabaseBrain(),
        '/bmiCalculator': (context) => BMICalculator(),
        '/bodyFatCalculator': (context) => BodyFatCalculator(),
        '/offlineMode': (context) => OfflineMode(),
      },
      initialRoute: '/',
    );
  }
}


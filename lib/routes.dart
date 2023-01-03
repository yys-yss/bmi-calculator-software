import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/ibw_calculator.dart';
import 'package:bmi_calculator/pages/offline_mode.dart';
import 'package:flutter/material.dart';
import 'pages/selection_page.dart';
import 'pages/bmi_calculator.dart';
import 'pages/body_fat_calculator.dart';
import 'pages/calorie_intake_calculator.dart';
import 'database_brain.dart';


class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      routes: {
        '/': (context) => SelectionPage(),
        '/bmiCalculator': (context) => BMICalculator(),
        '/bodyFatCalculator': (context) => BodyFatCalculator(),
        '/ibwCalculator': (context) => IBWCalculator(),
        '/CalorieIntakeCalculator': (context) => CalorieIntakeCalculator(),
        '/offlineMode': (context) => OfflineMode(),
      },
      initialRoute: '/',
    );
  }
}


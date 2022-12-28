import 'package:bmi_calculator/selection_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF592E83);
const kInactiveCardColor = Color(0xFF33114A);
const kBottomContainerColor = Color(0xFF60AB9A);
const kActiveSliderColor = Color(0xFF60AB9A);
const kInactiveSliderColor = Color(0xFFbdb0e3);
const kCardTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFbdb0e3),
);
const kHeavyTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const kLargeButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const kResultTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
);
const kCalculatedBMITextStyle = TextStyle(
  fontSize: 70.0,
  fontWeight: FontWeight.w600,
);
const kAdviceTextStyle = TextStyle(
  fontSize: 25.0,
);
const kBMITextStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.green,
  fontWeight: FontWeight.bold,
);
const kInfoTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFFbdb0e3),
);
const kLabelTextStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFFFFFFFF),
);
const kSelectionTextStyle = TextStyle(
  fontSize: 30.0,
  color: Color(0xFFFFFFFF),
  fontWeight: FontWeight.w600,
);

final kAppTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(color: Color(0xFF230C33)),
  scaffoldBackgroundColor: Color(0xFF230C33),
  textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),);

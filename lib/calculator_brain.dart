import 'package:flutter/material.dart';
import 'dart:math';

import 'constants.dart';

class CalculatorBrain {
  final int height;
  final int weight;

  late final double _bmi;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  Text getResult() {
    if (_bmi <= 25 && _bmi > 18.5) {
      return Text(
        'NORMAL',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (_bmi > 25 && _bmi <= 30) {
      return Text(
        'OVERWEIGHT',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.yellow[400],
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (_bmi > 30 && _bmi <= 35) {
      return Text(
        'SLIGHTLY OBESE',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (_bmi > 35 && _bmi <= 40) {
      return Text(
        'OBESE',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (_bmi > 40) {
      return Text(
        'DANGEROUSLY OBESE',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red[900],
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        'UNDERWEIGHT',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.cyan,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget getAdvice() {
    if (_bmi <= 25 && _bmi > 18.5) {
      return Text(
        'You are doing well. Keep it up!',
        style: kAdviceTextStyle,
      );
    } else if (_bmi > 25 && _bmi <= 30) {
      return Text(
        'You are slightly above normal weight. Maybe you could decrease the amount of fat in your diet.',
        style: kAdviceTextStyle,
        textAlign: TextAlign.center,
      );
    } else if (_bmi > 30 && _bmi <= 35) {
      return Text(
        'You are starting to become Obese. Eat less and exercise more!',
        style: kAdviceTextStyle,
        textAlign: TextAlign.center,
      );
    } else if (_bmi > 35 && _bmi <= 40) {
      return Text(
        'You have a high body fat percentage. Go on extreme diets and exercise everyday!',
        style: kAdviceTextStyle,
        textAlign: TextAlign.center,
      );
    } else if (_bmi > 40) {
      return Expanded(
        child: Container(
          child: Image.asset('assets/images/toofat.gif'),
          padding: EdgeInsets.only(bottom: 10),
        ),
      );
    } else {
      return Text(
        'You have a lower than normal body weight. Try to eat more!',
        style: kAdviceTextStyle,
        textAlign: TextAlign.center,
      );
    }
  }
}

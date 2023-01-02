import 'package:flutter/material.dart';
import 'dart:math';

import 'constants.dart';
import 'defines.dart';
class BMICalculatorBrain {
  final int height;
  final int weight;

  late final double _bmi;

  BMICalculatorBrain({required this.height, required this.weight});

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




class BodyFatCalculatorBrain {
  Gender? selectedGender = Gender.male;
  int age = 18;
  int height = 170;
  int neck = 50;
  int weight = 60;
  int waist = 80;
  int hip = 90;
  late final double _bodyFat;

  BodyFatCalculatorBrain({required this.height, required this.weight, required this.neck, required this.waist, required this.hip, required this.age, required this.selectedGender});
// https://1techplus.blogspot.com/2016/07/c-code-to-calculate-body-fat-of-person.html

  String calculateBodyFat() {
    if(selectedGender == Gender.male)
    {
      _bodyFat = ((495)/(1.0324 - 0.19077 * (log(waist - neck) / ln10) + 0.15456 * (log(height) / ln10))) - 450;
      return _bodyFat.toStringAsFixed(1);
    }
    else
    {
      _bodyFat = ((495)/(1.29579 - 0.35004 * (log((waist + hip) - neck) / ln10) + 0.22100 * (log(height) / ln10))) - 450;
      return _bodyFat.toStringAsFixed(1);
    }
  }
// https://tanita.eu/blog/healthy-body-fat-percentage
  Text getResult() {
    if(selectedGender == Gender.male) {
      if (_bodyFat > 0 && _bodyFat < 7) {
        return Text(
          'UNDERFAT',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (_bodyFat > 7 && _bodyFat <= 22) {
        return Text(
          'HEALTHY',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.yellow[400],
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (_bodyFat > 22 && _bodyFat <= 28) {
        return Text(
          'OVERFAT',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        );
      }
      else {
        return Text(
          'OBESE',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }
    else
    {
      if (_bodyFat > 0 && _bodyFat < 23) {
        return Text(
          'UNDERFAT',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (_bodyFat > 23 && _bodyFat <= 34) {
        return Text(
          'HEALTHY',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.yellow[400],
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (_bodyFat > 34 && _bodyFat <= 40) {
        return Text(
          'OVERFAT',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        );
      }
      else {
        return Text(
          'OBESE',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }
  }

  Widget getAdvice() {
    if(selectedGender == Gender.male) {
      if (_bodyFat <= 0 && _bodyFat > 7) {
        return Text(
          'Try to eat more.',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      } else if (_bodyFat > 7 && _bodyFat <= 22) {
        return Text(
          'You are doing well. Keep it up!',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      } else if (_bodyFat > 22 && _bodyFat <= 28) {
        return Text(
          'You are starting to become Obese. Eat less and exercise more!',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      }
      else {
        return Text(
          'You have a high body fat percentage. Go on extreme diets and exercise everyday!',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      }
    }
    else
    {
      if (_bodyFat <= 0 && _bodyFat > 23) {
        return Text(
          'Try to ear more.',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      } else if (_bodyFat > 23 && _bodyFat <= 34) {
        return Text(
          'You are doing well. Keep it up!',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      } else if (_bodyFat > 34 && _bodyFat <= 40) {
        return Text(
          'You are starting to become Obese. Eat less and exercise more!',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      }
      else {
        return Text(
          'You have a high body fat percentage. Go on extreme diets and exercise everyday!',
          style: kAdviceTextStyle,
          textAlign: TextAlign.center
        );
      }
    }
  }
}

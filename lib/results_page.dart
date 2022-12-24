import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'calculator_brain.dart';


class ResultsPage extends StatelessWidget {

  final String bmi;
  final Text resultText;
  final String advice;

  ResultsPage({required this.bmi, required this.resultText, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: resultText,
                  ),
                  Container(
                    child: Text(
                      bmi,
                      style: kCalculatedBMITextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      advice,
                      style: kAdviceTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        BottomButton(onTap: () {
          Navigator.pop(context);
        }, text: 'CALCULATE AGAIN')
        ],
      ),
    );
  }
}

import 'package:bmi_calculator/pages/offline_mode.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final Text resultText;
  final Widget advice;

  ResultsPage(
      {required this.bmi, required this.resultText, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Your Result',
                  style: kResultTextStyle,
                ),
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
                    child: advice,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'CALCULATE AGAIN')
        ],
      ),
    );
  }
}


class BodyFatResultsPage extends StatelessWidget {
  final String bodyFat;
  final Text resultText;
  final Widget advice;

  BodyFatResultsPage(
      {required this.bodyFat, required this.resultText, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BODY FAT CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Your Result',
                  style: kResultTextStyle,
                ),
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
                      bodyFat,
                      style: kCalculatedBMITextStyle,
                    ),
                  ),
                  Container(
                    child: advice,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'CALCULATE AGAIN')
        ],
      ),
    );
  }
}

import 'package:bmi_calculator/database_brain.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_card.dart';
import '../constants.dart';
import '../calculator_brain.dart';
import 'results_page.dart';
import 'package:bmi_calculator/defines.dart';

class IBWCalculator extends StatefulWidget {
  @override
  _IBWCalculatorState createState() => _IBWCalculatorState();
}

DatabaseBrain databaseBrain = DatabaseBrain();

class _IBWCalculatorState extends State<IBWCalculator> {

  @override
  void initState() {
    databaseBrain.getGender().then((value) {
      if (value == 'male') {
        selectedGender = Gender.male;
      } else if (value == 'female') {
        selectedGender = Gender.female;
      }
    });
    super.initState();
  }

  Gender? selectedGender;
  int height = 150;
  int weight = 60;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text('IDEAL WEIGHT'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kCardTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kHeavyTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kCardTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1.5,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 60.0,
                        max: 250.0,
                        activeColor: kActiveSliderColor,
                        inactiveColor: kInactiveSliderColor,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kCardTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          weight.toString(),
                          style: kHeavyTextStyle,
                        ),
                        Text(
                          'KG',
                          style: kCardTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1.5,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: weight.toDouble(),
                        min: 30.0,
                        max: 200.0,
                        activeColor: kActiveSliderColor,
                        inactiveColor: kInactiveSliderColor,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                IBWCalculatorBrain calculatorBrain = IBWCalculatorBrain(
                    height: height,
                    weight: weight,
                    selectedGender: selectedGender);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IBWResultsPage(
                      ibw: calculatorBrain.calculateIBW(),
                      resultText: calculatorBrain.getResult(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE',
            )
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;

  BottomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 5.0),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(2.5),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widges/card_content.dart';
import '../widges/reusable_card.dart';
import '../constants.dart';
import '../widges/rounded_button.dart';
import '../calculator_brain.dart';
import 'results_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../defines.dart';
class BodyFatCalculator extends StatefulWidget {
  @override
  _BodyFatCalculatorState createState() => _BodyFatCalculatorState();
}



class _BodyFatCalculatorState extends State<BodyFatCalculator> {
  Gender? selectedGender = Gender.female;
  int age = 18;
  int height = 170;
  int neck = 50;
  int weight = 60;
  int waist = 90;
  int hip = 110;
  int bodyFat = 15;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text('Body Fat Calculator'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: kCardTextStyle,
                          ),
                          Text(
                            height.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    height--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      height++;
                                    });
                                  }),
                            ],
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
                            "WEIGHT",
                            style: kCardTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "NECK",
                              style: kCardTextStyle,
                            ),
                            Text(
                              neck.toString(),
                              style: kHeavyTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      neck--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundIconButton(
                                    iconData: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        neck++;
                                      });
                                    }),
                              ],
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
                            "WAIST",
                            style: kCardTextStyle,
                          ),
                          Text(
                            waist.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    waist--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      waist++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HIP",
                            style: kCardTextStyle,
                          ),
                          Text(
                            hip.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    hip--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      hip++;
                                    });
                                  },),
                            ],
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
                            "AGE",
                            style: kCardTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                BodyFatCalculatorBrain bodyFatCalculatorBrain =
                BodyFatCalculatorBrain(height: height, weight: weight, age: age, waist: waist, hip: hip, neck: neck, selectedGender: selectedGender);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BodyFatResultsPage(
                      bodyFat: bodyFatCalculatorBrain.calculateBodyFat(),
                      resultText: bodyFatCalculatorBrain.getResult(),
                      advice: bodyFatCalculatorBrain.getAdvice(),
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

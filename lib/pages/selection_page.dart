import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'calorie_intake_calculator.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FirebaseAuth.instance.signOut();
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF230C33),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'BMI CALCULATOR',
                            style: kSelectionTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.dumbbell,
                          size: 35.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onPress: () {
                    Navigator.pushNamed(context, '/bmiCalculator');
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'BODY FAT',
                            style: kSelectionTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.percent,
                          size: 35.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onPress: () {
                    Navigator.pushNamed(context, '/bodyFatCalculator');
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'IDEAL WEIGHT',
                          style: kSelectionTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.weightScale,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                  onPress: () {
                    Navigator.pushNamed(context, '/ibwCalculator');
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'CALORIE INTAKE',
                            style: kSelectionTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.pizzaSlice,
                          size: 35.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onPress: ()
                  {
                    Navigator.pushNamed(context, '/CalorieIntakeCalculator');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

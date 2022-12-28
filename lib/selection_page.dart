import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FirebaseAuth.instance.signOut();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text('BMI CALCULATOR',
                    style: kSelectionTextStyle,),
                    Icon(Icons.fitness_center,
                    size: 35.0,),],
                  ),
                  onPress: () {
                    Navigator.pushNamed(context, '/bmiCalculator');
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';
import 'bmi_calculator.dart';

class IBWCalculator extends StatefulWidget {
  const IBWCalculator({Key? key}) : super(key: key);

  @override
  State<IBWCalculator> createState() => _IBWCalculatorState();
}

// TODO: ysf - create methods in calculator_brain.dart instead of writing the formulas here.

class _IBWCalculatorState extends State<IBWCalculator> {
  // Declare variables for height, weight, and gender
  int _height = 175; // Initial value for the height slider
  int _weight = 60;
  bool _isMale = true; // TODO: ysf - We already have enum for gender in defines.dart, use that.
  late double _idealWeight;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text('IDEAL WEIGHT CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                          _height.toString(),
                          style: kHeavyTextStyle,
                        ),
                        Text(
                          ' cm',
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
                        value: _height.toDouble(),
                        min: 60.0,
                        max: 250.0,
                        activeColor: kActiveSliderColor,
                        inactiveColor: kInactiveSliderColor,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
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
                          _weight.toString(),
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
                        value: _weight.toDouble(),
                        min: 30.0,
                        max: 200.0,
                        activeColor: kActiveSliderColor,
                        inactiveColor: kInactiveSliderColor,
                        onChanged: (double newValue) {
                          setState(() {
                            _weight = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Text('Gender:'),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Radio(
            //       value: true,
            //       groupValue: _isMale,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           _isMale = value!;
            //         });
            //       },
            //     ),
            //     Text('Male'),
            //     Radio(
            //       value: false,
            //       groupValue: _isMale,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           _isMale = value!;
            //         });
            //       },
            //     ),
            //     Text('Female'),
            //   ],
            // ),
            SizedBox(height: 20.0),
            BottomButton(
              onTap: () {
                 _idealWeight = _isMale
                    ? 50 + 0.91 * (_height - 152.4)
                    : 45.5 + 0.91 * (_height - 152.4) ;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(idealWeight: _idealWeight, weight: _weight,),
                    ),
                  );
              },
              text: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final double idealWeight;
  int weight;



  ResultScreen({Key? key, required this.idealWeight, required this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('IDEAL WEIGHT CALCULATOR'),
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
                      child: Text(
                          ' ${idealWeight.toStringAsFixed(1)} kg',
                      style:kResultTextStyle,),
                    ),
                    Container(
                      child: Text(
                        'Need to lose ${ (weight- idealWeight).toStringAsFixed(1)} kg',
                        style:kResultTextStyle,
                      ),
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
          ]
      ),
    );
  }
}

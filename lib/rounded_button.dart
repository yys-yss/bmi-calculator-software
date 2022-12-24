import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

class RoundIconButton extends StatelessWidget {

  final IconData iconData;
  final Function() onPressed;

  RoundIconButton({required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: kInactiveSliderColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

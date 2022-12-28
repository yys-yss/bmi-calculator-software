import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final Function()? onPress;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  ReusableCard({required this.color, this.cardChild, this.onPress, this.margin = const EdgeInsets.all(15.0), this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}

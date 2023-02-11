import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';

class ReUsableCardChild extends StatelessWidget {
  ReUsableCardChild({required this.icon, required this.label});

  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}

import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class CreateCustomIcon extends StatelessWidget {
  CreateCustomIcon({required this.customIcon, required this.label});

  final IconData customIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Icon(
          customIcon,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ReuseableContainer extends StatelessWidget {
  ReuseableContainer({Key? key, required this.colour, this.customChild})
      : super(key: key);

  final Color colour;
  final Widget? customChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: customChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}

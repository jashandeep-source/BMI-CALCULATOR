import 'package:flutter/material.dart';
import 'constants.dart';

class BottomCalculate extends StatelessWidget {
  BottomCalculate(
      {Key? key, required this.onPressed, required this.buttonTitle})
      : super(key: key);

  final String buttonTitle;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        child: Center(child: Text(buttonTitle, style: kButtonTextStyle)),
        height: heightOfBottomContainer,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(bottom: 20),
        color: Color.fromARGB(255, 177, 220, 178),
      ),
    );
  }
}

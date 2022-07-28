import 'package:bmicalculator/ReuseableContainer.dart';
import 'package:bmicalculator/bottomCalculateButton.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results(
      {required this.myBMI, required this.myResult, required this.myFeedback});
  final String myBMI;
  final String myResult;
  final String myFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR', style: kLabelTextStyle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  child: Text('Your Result', style: kNumTextStyle),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableContainer(
                colour: activeContainerColour,
                customChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        myResult.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(myBMI, style: kBMITextStyle),
                      Text(myFeedback,
                          textAlign: TextAlign.center, style: kLabelTextStyle),
                    ]),
              ),
            ),
            BottomCalculate(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE -CALACULATE'),
          ],
        ));
  }
}

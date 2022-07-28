// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReuseableContainer.dart';
import 'customIcon.dart';
import 'constants.dart';
import 'results.dart';
import 'RoundIconButton.dart';
import 'bottomCalculateButton.dart';
import 'calculationsBMI.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  int height = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR', style: kLabelTextStyle),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  child: ReuseableContainer(
                    colour: gender == Gender.male
                        ? activeContainerColour
                        : inactiveContainerColour,
                    customChild: CreateCustomIcon(
                      customIcon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: ReuseableContainer(
                      colour: gender == Gender.female
                          ? activeContainerColour
                          : inactiveContainerColour,
                      customChild: CreateCustomIcon(
                        customIcon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReuseableContainer(
                  colour: activeContainerColour,
                  customChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kNumTextStyle),
                          Text('cm', style: kLabelTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.white,
                          activeTrackColor: Colors.redAccent,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color.fromARGB(255, 191, 105, 99),
                          thumbColor: Colors.redAccent,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 80.0,
                            max: 230.0,
                            activeColor: Colors.redAccent,
                            inactiveColor: Colors.white,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableContainer(
                      colour: activeContainerColour,
                      customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(weight.toString(), style: kNumTextStyle),
                                Text(
                                  'kg',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                    child: ReuseableContainer(
                      colour: activeContainerColour,
                      customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kLabelTextStyle),
                            Text(age.toString(), style: kNumTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomCalculate(
                  onPressed: () {
                    CalculateBMI calc =
                        CalculateBMI(height: height, weight: weight);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Results(
                        myBMI: calc.getBMI(),
                        myResult: calc.getResult(),
                        myFeedback: calc.giveFeedback(),
                      );
                    }));
                  },
                  buttonTitle: 'CALCULATE'),
            )
          ],
        ));
  }
}

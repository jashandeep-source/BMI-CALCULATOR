import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        onPressed();
      },
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      fillColor: Colors.white10,
    );
  }
}

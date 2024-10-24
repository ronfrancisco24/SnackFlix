import 'package:flutter/material.dart';
import 'constants.dart';

//TODO: create other buttons,

class RedOvalButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const RedOvalButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: kPoppins,
          ),
        ),
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            color: kLightRed, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

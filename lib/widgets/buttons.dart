import 'package:flutter/material.dart';
import 'constants.dart';

//TODO: create other buttons,

// red oval button

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
            style: kBlackPoppins,
          ),
        ),
        height: 70,
        width: 250,
        decoration: BoxDecoration(
            color: kLightRed, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

// red square button

class RedSquareButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const RedSquareButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: kBlackPoppins,
          ),
        ),
        height: 100,
        width: 130,
        decoration: BoxDecoration(
            color: kLightRed, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

// black square button

class BlackSquareButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const BlackSquareButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: kWhitePoppins,
          ),
        ),
        height: 100,
        width: 130,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

// black oval button

class BlackOvalButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const BlackOvalButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: kGrayPoppins,
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



import 'package:flutter/material.dart';
import 'constants.dart';

//TODO: create other buttons,

// Oval Buttons

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

// Square Buttons

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

class BlueSquareButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const BlueSquareButton({this.text, this.onPressed});

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

class GraySquareButton extends StatelessWidget {
  final String? text;
  final IconData? icon; // New IconData parameter
  final void Function()? onPressed;

  const GraySquareButton({this.text, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: icon != null // If an icon is provided, show the icon, otherwise show text
              ? Icon(icon, color: Colors.white, size: 30)  // Customize the icon color and size
              : Text(
            text!,
            style: kWhitePoppins,
          ),
        ),
        height: 100,
        width: 130,
        decoration: BoxDecoration(
          color: kGray,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}



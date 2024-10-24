import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/constants.dart';

class SnackOption extends StatelessWidget {
  final Widget? child;
  final String? label;
  final String? imagePath;

  const SnackOption({this.child, this.label, this.imagePath});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: kBlack,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Image.asset(imagePath!)


        ],
      ),
    );
  }
}

//TODO: finish this..
import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/buttons.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/options.dart';
import 'package:vending_machine/widgets/snack_option.dart';

class KeypadPage extends StatefulWidget {
  const KeypadPage({super.key});

  @override
  State<KeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends State<KeypadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: kLinearGradient,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

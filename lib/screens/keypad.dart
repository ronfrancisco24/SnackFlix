import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/buttons.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/options.dart';
import 'package:vending_machine/widgets/snack_option.dart';
import 'menu.dart';

class KeypadPage extends StatefulWidget {
  KeypadPage({super.key});

  @override
  State<KeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends State<KeypadPage> {
  List<String> selections = [];

  void _addSelection(String value){
    if (selections.length < 2){
      selections.add(value);
      setState(() {

      });
    } else {
      print('limit has been reached.');
    }
  }

  void _deleteSelection(){
    if (selections.isNotEmpty){
      selections.removeLast();
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: kLinearGradient,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 150,),
                      Expanded(
                        child: Row( //TODO: display order
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (selections.isNotEmpty)
                              Text(
                                'Order: ${selections.join('')}',
                                style: kWhitePoppins.copyWith(fontSize: 20),
                              )
                            else
                              Text(
                                'Make order. (Format: Letter, Number)',
                                style: kGrayPoppins.copyWith(fontSize: 20),
                              ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GridView.count(
                        padding: EdgeInsets.all(12),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          BlueSquareButton(
                            text: 'A',
                            onPressed: () {
                              _addSelection('A');
                            },
                          ),
                          BlueSquareButton(
                            text: 'B',
                            onPressed: () {
                              _addSelection('B');
                            },
                          ),
                          BlueSquareButton(
                            text: 'C',
                            onPressed: () {
                              _addSelection('C');
                            },
                          ),
                          GraySquareButton(
                            text: '1',
                            onPressed: () {
                              _addSelection('1');
                            },
                          ),
                          GraySquareButton(
                            text: '2',
                            onPressed: () {
                              _addSelection('2');
                            },
                          ),
                          GraySquareButton(
                            text: '3',
                            onPressed: () {
                              _addSelection('3');
                            },
                          ),
                          GraySquareButton(
                            text: '4',
                            onPressed: () {
                              _addSelection('4');
                            },
                          ),
                          GraySquareButton(
                            text: '5',
                            onPressed: () {
                              _addSelection('5');
                            },
                          ),
                          GraySquareButton(
                            text: '6',
                            onPressed: () {
                              _addSelection('6');
                            },
                          ),
                          GraySquareButton(
                            icon: Icons.backspace,
                            onPressed: () {
                              _deleteSelection();
                            },
                          ),
                          GraySquareButton(
                            text: '0',
                            onPressed: () {
                              _addSelection('0');
                            },
                          ),
                          GraySquareButton(
                            icon: Icons.input,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MenuPage())
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

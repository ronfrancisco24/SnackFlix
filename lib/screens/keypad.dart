import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/buttons.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/options.dart';
import 'package:vending_machine/widgets/snack_option.dart';
import 'menu.dart';

class KeypadPage extends StatefulWidget {

  final Function(SnackOption) addToOrder;

  KeypadPage({Key? key, required this.addToOrder}) : super(key:key);

  @override
  State<KeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends State<KeypadPage> {
  final Options options = Options();

  List<String> selections = []; //TODO: has to be globalized.

  String get userSelection => selections
      .join(''); // a getter to retrieve user selection as a single string.

  void _addSelection(String value) {
    //TODO: has to check if the user inputted one character and one number only.

    final RegExp regExp = RegExp(r'[A-C][1-6]$');

    if (selections.length < 2) {
      selections.add(value);
      setState(() {});
    } else {
      print('limit has been reached.');
    }
  }

  void _deleteSelection() {
    if (selections.isNotEmpty) {
      selections.removeLast();
      setState(() {});
    }
  }

  SnackOption getSelectedOption() {
    return options.snackOptions.firstWhere(
          (option) => option.label == userSelection,
      orElse: () {
        throw Exception('No matching snack found for selection: $userSelection');
      },
    );
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
                      SizedBox(
                        height: 150,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (selections.isNotEmpty)
                              Text(
                                'Order: ${userSelection}',
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
                            icon: Icons.home,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuPage()));
                            },
                          ),
                          GraySquareButton(
                            icon: Icons.input,
                            onPressed: () {
                              final SnackOption? selectedOption = getSelectedOption();
                              //TODO: if input matches an item, add to selectedSnack list
                              if (selectedOption != null){
                                widget.addToOrder(selectedOption); // Use widget.addToOrder to call the function
                                print('Snack added: ${selectedOption.productName}');
                              } else {
                                print('No matching snack found for selection.');
                              }
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

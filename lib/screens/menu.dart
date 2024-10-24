import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/buttons.dart';
import 'transaction.dart';

void main() => runApp(const MenuPage());

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: kLinearGradient,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text('Hey\nWant a snack?', style: kPoppins),
                    RedOvalButton(
                      text: 'Transaction',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransactionPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kBlack,
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: create a list that holds different snacks.

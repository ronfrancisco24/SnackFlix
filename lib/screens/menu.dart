import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/buttons.dart';
import 'package:vending_machine/widgets/snack_option.dart';
import 'transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<SnackOption> selectedSnacks = [];

  final List<SnackOption> snackOptions = [
    SnackOption(
      productName: 'Lunchly',
      price: 21.00,
      imagePath: 'images/snack_pic.png',
      label: 'A1',
    ),
    SnackOption(
      productName: 'Coke',
      price: 21.00,
      imagePath: 'images/snack_pic.png',
      label: 'A1',
    ),
    SnackOption(
      productName: 'Gatorade',
      price: 21.00,
      imagePath: 'images/snack_pic.png',
      label: 'A1',
    ),
  ];

  // adds snacks to cart
  void addToCare(SnackOption snack) {
    setState(() {
      selectedSnacks.add(snack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: kLinearGradient,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Hey,\n', style: kWhitePoppins),
                        TextSpan(text: 'Want a ', style: kWhitePoppins),
                        TextSpan(
                            text: 'Snack?',
                            style: kWhitePoppins.copyWith(color: kLightRed))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25),
                      itemCount: snackOptions.length,
                      itemBuilder: (context, index) {
                        final snack = snackOptions[index];
                        return SnackOption(
                          productName: snack.productName,
                          label: snack.label,
                          imagePath: snack.imagePath,
                          price: snack.price,
                        );
                      },
                    ),
                  ),
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
              child: Column(children: [
                SizedBox(
                  height: 80,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: ('My\n'),
                    ),
                    TextSpan(
                      text: ('Order\n'),
                    ),
                  ]),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

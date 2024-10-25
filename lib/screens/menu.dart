import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // provider
import 'package:vending_machine/widgets/constants.dart';
import 'package:vending_machine/widgets/buttons.dart';
import 'package:vending_machine/controllers/options.dart';
import 'package:vending_machine/controllers/snack_provider.dart';
import 'package:vending_machine/controllers/snack_option.dart';
import 'keypad.dart';
import 'transaction.dart';

class MenuPage extends StatefulWidget {

  MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  //TODO: have to incorporate DFA for transactions
  //TODO: use provider package (already incorporated) for the balance/transaction.
  //TODO: balance should be updated dependent on the transaction page.

  @override
  Widget build(BuildContext context) {
    final snackProvider = Provider.of<SnackProvider>(context);
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
                    flex: 9,
                    child: GridView.builder(
                      padding: EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25),
                      itemCount: Options().snackOptions.length,
                      itemBuilder: (context, index) {
                        final snack = Options().snackOptions[index];
                        return SnackOption(
                          productName: snack.productName,
                          label: snack.label,
                          imagePath: snack.imagePath,
                          price: snack.price,
                        );
                      },
                    ),
                  ),
                  Text('Balance P: 0.00',
                      style: kWhitePoppins.copyWith(fontSize: 15)),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 1,
                    child: RedOvalButton(
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
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: kBlack,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: ('My\n'),
                            style: kWhitePoppins.copyWith(fontSize: 18)),
                        TextSpan(
                            text: ('Order\n'),
                            style: kWhitePoppins.copyWith(fontSize: 18)),
                        TextSpan(
                            text: ('Waiting For a Munch'),
                            style: kGrayPoppins.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: Divider(
                      color: kGray,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      padding: EdgeInsets.all(15),
                      shrinkWrap: true,
                      itemCount:
                          snackProvider.selectedSnacks.length, // should be selected snacks
                      itemBuilder: (context, index) {
                        final snack =
                            snackProvider.selectedSnacks[index]; // should be selected snacks
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: SnackOption(
                            productName: snack.productName,
                            label: snack.label,
                            imagePath: snack.imagePath,
                            price: snack.price,
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: BlueSquareButton(
                        text: 'Keypad',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KeypadPage(addToOrder: snackProvider.addToOrder), //makes addToOrder callable.
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: BlueSquareButton(
                        text: 'Reset',
                        onPressed: () {
                          snackProvider.resetOrder();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: Divider(
                      color: kGray,
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [TextSpan(text: 'Total:\n', style: kGrayPoppins.copyWith(fontSize: 15)),
                        TextSpan(text: 'P: ${snackProvider.totalPrice.toStringAsFixed(2)}', style: kGrayPoppins.copyWith(fontSize: 15)), ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: RedSquareButton(
                        text: 'Done',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransactionPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

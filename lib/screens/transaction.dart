import 'package:flutter/material.dart';
import 'package:vending_machine/screens/menu.dart';
import 'package:vending_machine/widgets/constants.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/widgets/snack_bar.dart';
import 'package:vending_machine/controllers/transition_dfa.dart';
import 'package:vending_machine/controllers/transaction_provider.dart';

import '../widgets/buttons.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    void _handleAddToBalance(double amount) {
      transactionProvider.addToBalance(amount);

      // if current state equals to exceeded limit, provide alert dialog.
      if (transactionProvider.currentState == TransactionState.exceededLimit) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Exceeds Limit"),
            content:
                Text("You cannot have more than 100 pesos in the machine."),
            actions: [
              TextButton(
                onPressed: () {
                  transactionProvider.resetToIdle();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    // handles confirming transaction
    // once transaction is confirmed, return to menu page.
    void _handleConfirmTransaction() {
      transactionProvider.confirmTransaction();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuPage()));
    }

    // uses dfa to handle refund
    void _handleRefund() {
      double refundedAmount =
          transactionProvider.refund(); // Capture the refunded amount

      if (refundedAmount == 0){
        SnackBarHelper.showSnackBar(context,
            'No balance to refund.'); // Use the captured amount
      } else {
        SnackBarHelper.showSnackBar(context,
            'Successfully refunded ₱${refundedAmount.toStringAsFixed(2)}!'); // Use the captured amount
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Amount', style: kWhitePoppins),
        backgroundColor: kBlack,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: kLinearGradient,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    width: 400,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: kBlueGray,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Text('Total Balance',
                            style: kWhitePoppins.copyWith(
                                fontSize: 15, color: kDarkGray)),
                        Text(
                          '₱ ${transactionProvider.balance.toStringAsFixed(2)}',
                          style: kWhitePoppins.copyWith(fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _handleAddToBalance(1),
                          child: Image.asset('images/piso.png', width: 130),
                        ),
                        GestureDetector(
                          onTap: () => _handleAddToBalance(5),
                          child:
                              Image.asset('images/five_piso.png', width: 125),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _handleAddToBalance(10),
                          child: Image.asset('images/ten_piso.png', width: 135),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _handleAddToBalance(20),
                          child: Image.asset('images/twenty.png', width: 130),
                        ),
                        GestureDetector(
                          onTap: () => _handleAddToBalance(50),
                          child: Image.asset('images/fifty.png', width: 140),
                        ),
                        GestureDetector(
                          onTap: () => _handleAddToBalance(100),
                          child: Image.asset('images/hundred.png', width: 139),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SizedBox(
                      width: 380,
                      child: DarkGrayOvalButton(
                        onPressed: _handleRefund,
                        text:
                          'Refund',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SizedBox(
                      width: 380,
                      child: RedOvalButton(
                        onPressed: _handleConfirmTransaction,
                        text:
                          'Confirm',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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

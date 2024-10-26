import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/snack_provider.dart';
import 'snack_bar.dart';
import 'package:vending_machine/controllers/transaction_provider.dart';

class CheckOut {
  void checkOut(BuildContext context) {
    final snackProvider = Provider.of<SnackProvider>(context, listen: false);
    final transactionProvider = Provider.of<TransactionProvider>(context, listen: false); // Set listen to false

    if (snackProvider.selectedSnacks.isEmpty){
      SnackBarHelper.showSnackBar(context, 'You have not selected any snacks.');
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Checkout"),
        content: Text("Would you like to confirm checkout?"),
        actions: [
          TextButton(
            onPressed: () {
              if (transactionProvider.balance < snackProvider.totalPrice) {
                SnackBarHelper.showSnackBar(context, "You do not have enough balance inserted in the machine!");
              } else {
                transactionProvider.updateBalance(transactionProvider.balance - snackProvider.totalPrice);
                snackProvider.resetOrder();
                SnackBarHelper.showSnackBar(context, "Transaction completed!");
              }
              Navigator.of(context).pop();
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }
}

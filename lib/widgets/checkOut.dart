import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vending_machine/controllers/BalanceManager.dart';
import '../controllers/snack_provider.dart';
import 'snack_bar.dart';

class CheckOut{
  void checkOut(BuildContext context) {
    final snackProvider = Provider.of<SnackProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Checkout"),
        content: Text("Would you like to confirm checkout?"),
        actions: [
          // 'Yes' button
          TextButton(
            onPressed: () {
              if(BalanceManager().balance < snackProvider.totalPrice){
                SnackBarHelper.showSnackBar(context, "You do not have enough balance inserted in the machine!");
              } else{
                BalanceManager().balance -= snackProvider.totalPrice;
                snackProvider.resetOrder();
                SnackBarHelper.showSnackBar(context, "Transaction completed!");
              }
              Navigator.of(context).pop();
            },
            child: Text("Yes"),
          ),
          // 'Cancel' button
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Closes the dialog
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
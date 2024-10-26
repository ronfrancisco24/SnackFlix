import 'package:flutter/material.dart';
import 'package:vending_machine/controllers/transition_dfa.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionDFA transactionDFA = TransactionDFA();

  TransactionState get currentState => transactionDFA.currentState;
  double get balance => transactionDFA.balance;

  void addToBalance(double amount) {
    transactionDFA.addToBalance(amount);
    notifyListeners();
  }

  void updateBalance(double amount) {
    transactionDFA.balance = amount;
    notifyListeners();
  }

  void resetToIdle() {
    transactionDFA.resetToIdle();
    notifyListeners();
  }

  void confirmTransaction() {
    transactionDFA.confirmTransaction();
    notifyListeners();
  }

  double refund() {
    double refundAmount = transactionDFA.refund();
    notifyListeners();
    return refundAmount;
  }
}

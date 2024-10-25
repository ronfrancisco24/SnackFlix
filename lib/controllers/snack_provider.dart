import 'package:flutter/material.dart';
import 'snack_option.dart';

class SnackProvider with ChangeNotifier {

  final List<SnackOption> _selectedSnacks = [];

  List<SnackOption> get selectedSnacks => _selectedSnacks;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  // adds snacks to cart
  void addToOrder(SnackOption snack) {
      _selectedSnacks.add(snack);
      _totalPrice += snack.price!;
      print('Current snacks in order: $_selectedSnacks');
      notifyListeners();
  }

  void resetOrder(){
    _selectedSnacks.clear();
    _totalPrice = 0;
    notifyListeners();
  }

}
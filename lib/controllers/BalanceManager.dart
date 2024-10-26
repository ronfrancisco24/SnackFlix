
class BalanceManager {
  static final BalanceManager _instance = BalanceManager._internal();

  factory BalanceManager(){
    return _instance;
  }

  BalanceManager._internal();
  double balance = 0;
}
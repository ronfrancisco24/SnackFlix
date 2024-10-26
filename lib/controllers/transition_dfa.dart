enum TransactionState { idle, addingMoney, exceededLimit, confirmedTransaction, refunded }

class TransactionDFA {

  TransactionState _currentState = TransactionState.idle;
  double balance = 0.0;

  TransactionState get currentState => _currentState;

  // Transition to adding money
  void addToBalance(double amount) {
    if (balance + amount > 100) {
      _currentState = TransactionState.exceededLimit;
    } else {
      balance += amount;
      _currentState = TransactionState.addingMoney;
    }
  }

  // Transition to idle from adding money
  void resetToIdle() {
    _currentState = TransactionState.idle;
  }

  // Transition to confirmed transaction
  void confirmTransaction() {
    _currentState = TransactionState.confirmedTransaction;
  }

  // Transition to refunded and return the amount
  double refund() {
    double refundAmount = balance; // Capture the current balance to refund
    balance = 0; // Reset balance to 0
    _currentState = TransactionState.refunded;
    return refundAmount;
  }
}

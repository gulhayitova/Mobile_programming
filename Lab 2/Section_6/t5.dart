class Account {
  double _balance = 0;

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      print('Balance cannot be negative');
    } else {
      _balance = value;
    }
  }
}

void main() {
  var acc = Account();
  acc.balance = 100;
  print(acc.balance);
  acc.balance = -50; // not allowed
  print(acc.balance);
}

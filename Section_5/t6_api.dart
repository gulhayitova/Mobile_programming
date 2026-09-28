class Calculator {
  double lastResult = 0;

  double add(double a, double b) {
    lastResult = a + b;
    return lastResult;
  }

  double subtract(double a, double b) {
    lastResult = a - b;
    return lastResult;
  }
}

void main() {
  var calc = Calculator();
  print(calc.add(5, 3));
  print(calc.subtract(5, 3));
}

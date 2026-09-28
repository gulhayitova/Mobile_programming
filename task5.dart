// /// Represents a bank account balance .
// ///
// /// Throws an [ ArgumentError ] if [ initialDeposit ] is negative .
// class BankAccount {
//   double balance ;
//   BankAccount ( double initialDeposit ) : balance = initialDeposit {
//     if ( initialDeposit < 0) throw ArgumentError ('Deposit cannot be negative ');
//   }
// }

import 'dart:math';

void main() {
  // Coefficients of ax^2 + bx + c = 0
  double a = 1, b = -3, c = 2;

  /* The discriminant tells us how many real roots exist:
     d > 0 -> two roots, d == 0 -> one root, d < 0 -> none. */
  double d = b * b - 4 * a * c;

  if (d >= 0) {
    // Quadratic formula: x = (-b ± sqrt(d)) / 2a
    print('x1 = ${(-b + sqrt(d)) / (2 * a)}');
    print('x2 = ${(-b - sqrt(d)) / (2 * a)}');
  }
}
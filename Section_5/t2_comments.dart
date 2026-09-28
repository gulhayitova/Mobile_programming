void main() {
  double a = 19, b = 10;

  // Subtraction of a - b
  print('$a - $b = ${a - b}');

  /*  The whole part of the division of a and b and the modulus of 19 by 10 make up
  the digits of a.*/
  print('The digits of $a are ${(a/b).floor()} and ${(a%b).floor()}');
}
int divide(int a, int b) {
  if (b == 0) {
    throw UnsupportedError('Cannot divide by zero');
  }
  return a ~/ b;
}

void main() {
  try {
    print(divide(10, 2));
    print(divide(10, 0));
  } on UnsupportedError catch (e) {
    print('Error: $e');
  }
}

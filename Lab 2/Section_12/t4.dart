void main() {
  try {
    int number = int.parse('abc');
    print(number);
  } on FormatException {
    print('That is not a number');
  } on ArgumentError {
    print('Bad argument');
  } catch (e) {
    print('Some other error: $e');
  }
}

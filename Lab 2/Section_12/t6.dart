void readAge(String text) {
  try {
    int age = int.parse(text);
    print('Age is $age');
  } catch (e) {
    print('readAge had a problem, sending it up');
    rethrow;
  }
}

void main() {
  try {
    readAge('abc');
  } catch (e) {
    print('main caught it: $e');
  }
}

/// Checks user input.
class Validator {
  /// Returns true if [text] is not empty.
  bool isNotBlank(String text) {
    return text.isNotEmpty;
  }

  /// Checks if [age] is 18 or more.
  ///
  /// Returns true if adult, false if not.
  /// Throws an [ArgumentError] if [age] is negative.
  bool isAdult(int age) {
    if (age < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    return age >= 18;
  }
}
void main() {
  var v = Validator();
  print(v.isNotBlank('hello'));
  print(v.isAdult(20));
}

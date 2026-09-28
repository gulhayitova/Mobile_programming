void greet(String? name) {
  if (name == null || name.isEmpty) {
    throw ArgumentError('Name cannot be empty or null');
  }
  print('Hello $name');
}

void main() {
  try {
    greet('Ali');
    greet('');
  } catch (e) {
    print('Error: $e');
  }
}

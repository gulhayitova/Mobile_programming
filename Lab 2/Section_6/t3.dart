class Person {
  final String name;
  final int age;

  Person(this.name, int age)
      : age = age < 0 ? throw ArgumentError('Age cannot be negative') : age;
}

void main() {
  var p = Person('Ali', 20);
  print('${p.name} is ${p.age}');

  try {
    var bad = Person('Vali', -5);
    print(bad.age);
  } catch (e) {
    print('Error: $e');
  }
}

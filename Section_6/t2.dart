class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void main() {
  var p1 = Person('Ali', 20);
  print('Name: ${p1.name}');
  print('Age: ${p1.age}');
}

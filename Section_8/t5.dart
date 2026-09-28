abstract class Employee {
  String name;
  Employee(this.name);

  void showName() {
    print('Name: $name');
  }

  double salary();
}

class Manager extends Employee {
  Manager(super.name);

  @override
  double salary() {
    return 5000;
  }
}

void main() {
  var m = Manager('Ali');
  m.showName();
  print('Salary: ${m.salary()}');
}

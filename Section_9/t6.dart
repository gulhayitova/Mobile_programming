class Speaker {
  void speak() {
    print('Speaking');
  }
}

class Person implements Speaker {
  @override
  void speak() {
    print('Person speaks (my own code)');
  }
}

mixin Dancer {
  void dance() {
    print('Dancing (code from mixin)');
  }
}

class Kid with Dancer {}

void main() {
  Person().speak();
  Kid().dance();
}

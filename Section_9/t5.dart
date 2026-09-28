class Animal {
  void eat() {
    print('Eating');
  }
}

mixin Runner on Animal {
  void run() {
    eat();
    print('Running');
  }
}

class Dog extends Animal with Runner {}

void main() {
  var d = Dog();
  d.run();
}

// final class: other files cannot extend or implement it
final class Engine {
  void start() {
    print('Engine started');
  }
}

// base class: other files can extend it but not implement it
base class Animal {
  void breathe() {
    print('Breathing');
  }
}

base class Cat extends Animal {}

void main() {
  Engine().start();
  Cat().breathe();
}
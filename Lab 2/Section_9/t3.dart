mixin Flyable {
  void fly() {
    print('Flying in the sky');
  }
}

class Bird with Flyable {}

void main() {
  var b = Bird();
  b.fly();
}

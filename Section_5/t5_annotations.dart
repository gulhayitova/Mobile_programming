class Animal {
  /// Makes a sound.
  void speak() {
    print('Some sound');
  }

  /// Old way to make a sound.
  ///
  /// Use [speak] instead.
  @deprecated
  void oldSpeak() {
    print('Old sound');
  }
}

class Dog extends Animal {
  /// Dog barks instead of a normal sound.
  @override
  void speak() {
    print('Woof');
  }
}

void main() {
  var d = Dog();
  d.speak();
}

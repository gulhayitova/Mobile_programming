sealed class Animal {}

class Dog extends Animal {}

class Cat extends Animal {}

String sound(Animal a) {
  return switch (a) {
    Dog() => 'Woof',
    Cat() => 'Meow',
  };
}

void main() {
  print(sound(Dog()));
  print(sound(Cat()));
}

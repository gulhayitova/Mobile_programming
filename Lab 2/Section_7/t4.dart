abstract class Speaker {
  String speak();
}

enum Pet implements Speaker {
  dog,
  cat;

  @override
  String speak() {
    if (this == Pet.dog) {
      return 'Woof';
    } else {
      return 'Meow';
    }
  }

  String describe() {
    return '$name says ${speak()}';
  }
}

void main() {
  print(Pet.dog.describe());
  print(Pet.cat.describe());
}

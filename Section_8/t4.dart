class Shape {
  void info() {
    print('I am a shape');
  }
}

class Polygon extends Shape {
  int sides = 0;
}

class Triangle extends Polygon {
  Triangle() {
    sides = 3;
  }
}

void main() {
  var t = Triangle();
  t.info();
  print('Sides: ${t.sides}');
}

abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

void main() {
  List<Shape> shapes = [Circle(2), Rectangle(3, 4)];

  for (var s in shapes) {
    print('Area: ${s.area()}');
  }
}

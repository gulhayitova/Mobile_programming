class Vehicle {
  final String brand;
  Vehicle(this.brand);
}

class Car extends Vehicle {
  final int doors;

  Car(super.brand, this.doors);
}

void main() {
  var car = Car('Toyota', 4);
  print('${car.brand} has ${car.doors} doors');
}

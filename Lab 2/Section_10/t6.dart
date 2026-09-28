abstract class DiscountStrategy {
  double apply(double price);
}

class NoDiscount implements DiscountStrategy {
  @override
  double apply(double price) => price;
}

class TenPercentOff implements DiscountStrategy {
  @override
  double apply(double price) => price * 0.9;
}

class Cart {
  DiscountStrategy strategy;
  Cart(this.strategy);

  double total(double price) {
    return strategy.apply(price);
  }
}

void main() {
  var cart = Cart(NoDiscount());
  print(cart.total(100));

  cart.strategy = TenPercentOff();
  print(cart.total(100));
}

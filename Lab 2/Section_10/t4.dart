class Repository<T> {
  final List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  List<T> getAll() {
    return items;
  }
}

void main() {
  var names = Repository<String>();
  names.add('Ali');
  names.add('Vali');
  print(names.getAll());

  var numbers = Repository<int>();
  numbers.add(1);
  numbers.add(2);
  print(numbers.getAll());
}

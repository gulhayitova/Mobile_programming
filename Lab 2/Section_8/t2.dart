enum Box<T> {
  number<int>(5),
  word<String>('hello');

  final T value;
  const Box(this.value);

  // static helper
  static void printAll() {
    for (var b in Box.values) {
      print(b.value);
    }
  }
}

void main() {
  Box.printAll();
}

void main() {
  var stream = Stream.fromIterable([1, 2, 2, 3, 4, 4, 5]);

  stream
      .map((x) => x * 2) 
      .where((x) => x > 4)
      .distinct()             
      .listen((x) => print(x));
}

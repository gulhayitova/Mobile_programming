Stream<int> numbers() async* {
  yield 1;
  yield 2;
  throw Exception('Something broke');
}

void main() {
  numbers().handleError((error) {
    print('Caught error: $error');
  }).listen((value) {
    print('Got $value');
  });
}

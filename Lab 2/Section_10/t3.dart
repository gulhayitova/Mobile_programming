void main() {
  Object x = 'hello';

  if (x is String) {
    print('It is a String with length ${x.length}');
  }

  String s = x as String;
  print(s.toUpperCase());

  try {
    int n = x as int;
    print(n);
  } catch (e) {
    print('Cannot cast String to int');
  }
}

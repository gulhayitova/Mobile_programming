enum Color { red, green, blue }

void main() {
  var input = 'green';

  try {
    var c = Color.values.byName(input);
    print('Found: $c');
    var bad = Color.values.byName('purple');
    print(bad);
  } catch (e) {
    print('That color does not exist');
  }
}

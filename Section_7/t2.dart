enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void main() {
  for (var d in Day.values) {
    print(d.name);
  }
}

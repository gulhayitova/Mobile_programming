import 'dart:async';

void main() {
  int count = 0;
  late StreamSubscription<int> sub;

  var stream = Stream<int>.periodic(Duration(seconds: 1), (i) => i);

  sub = stream.listen((value) {
    count++;
    print('Tick $count');

    if (count == 5) {
      sub.cancel();
      print('Cancelled after 5');
    }
  });
}

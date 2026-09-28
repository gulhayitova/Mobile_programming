Future<String> task1() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Task 1 done';
}

Future<String> task2() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Task 2 done';
}

Future<String> task3() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Task 3 done';
}

void main() async {
  var results = await Future.wait([task1(), task2(), task3()]);
  print(results);
}

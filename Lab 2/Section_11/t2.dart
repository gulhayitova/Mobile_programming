Future<String> getUser() async {
  print('Looking up user...');
  await Future.delayed(Duration(seconds: 2));
  return 'User: Ali, age 20';
}

void main() async {
  var user = await getUser();
  print(user);
}

class UserData {
  final int id;
  final String name;

  const UserData(this.id, this.name);
}

void main() {
  const user = UserData(1, 'Ali');
  print('${user.id} ${user.name}');
}

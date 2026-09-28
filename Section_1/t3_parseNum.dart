void main(List <String > arguments ) {
  double sum = 0;
  for (final arg in arguments){
    final n = double.tryParse(arg);
    if (n == null){
      print('$arg is not a valid number.');
      return;
    }
    sum = sum + n;
  }
  print(sum);
}
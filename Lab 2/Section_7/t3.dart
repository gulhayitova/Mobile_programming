enum Status { loading, success, error }

String showText(Status s) {
  return switch (s) {
    Status.loading => 'Please wait...',
    Status.success => 'Done!',
    Status.error => 'Something went wrong',
  };
}

void main() {
  print(showText(Status.loading));
  print(showText(Status.success));
  print(showText(Status.error));
}

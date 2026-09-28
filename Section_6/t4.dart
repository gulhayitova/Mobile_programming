class Settings {
  // private constructor
  Settings._internal();

  static final Settings _instance = Settings._internal();

  factory Settings() {
    return _instance;
  }
}

void main() {
  var a = Settings();
  var b = Settings();
  print(identical(a, b)); // true
}

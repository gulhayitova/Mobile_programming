abstract interface class DBConnector {
  void connect();
  void disconnect();
}

class MySQLConnector implements DBConnector {
  @override
  void connect() {
    print('Connected to MySQL');
  }

  @override
  void disconnect() {
    print('Disconnected from MySQL');
  }
}

void main() {
  var db = MySQLConnector();
  db.connect();
  db.disconnect();
}

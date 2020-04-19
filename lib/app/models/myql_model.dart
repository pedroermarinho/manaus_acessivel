class MysqlModel {
  String host;
  String user;
  String password;
  String database;
  String prefix;
  int port;

  MysqlModel({
    this.host,
    this.user,
    this.password,
    this.database,
    this.prefix,
    this.port,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "host": host,
      "user": user,
      "password": password,
      "database": database,
      "prefix": prefix,
      "port": port,
    };
    return map;
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/myql_model.dart';
import 'package:manausacessivel/app/shared/config/config_repository_controller.dart';
import 'package:manausacessivel/app/shared/mysql/repository/mysql_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';

class MysqlRepository implements IMysqlRepository {
  final _configRepositoryController = Modular.get<ConfigRepositoryController>();

  @observable
  MySqlConnection _conn;

  @action
  setConnection(MySqlConnection value) => _conn = value;

  MysqlRepository() {
    getConnection();
  }

  @override
  void dispose() {
    if (_conn != null) {
      _conn.close();
    }
  }

  @override
  Future<MySqlConnection> getConnection() async {
    print("getConnection");
    if (_conn == null) {
      MysqlModel mysql = await _configRepositoryController.getMysql();
      print("++++++++++++++++" + mysql.toMap().toString());
      var conn = await MySqlConnection.connect(
        ConnectionSettings(
          host: mysql.host,
          port: mysql.port,
          user: mysql.user,
          db: mysql.database,
          password: mysql.password,
        ),
      );
      setConnection(conn);
    }
    return _conn;
  }
}

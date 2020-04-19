import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/shared/mysql/repository/mysql_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';

part 'mysql_repository_controller.g.dart';

class MysqlRepositoryController = _MysqlRepositoryControllerBase
    with _$MysqlRepositoryController;

abstract class _MysqlRepositoryControllerBase with Store {
  final _mysqlRepository = Modular.get<IMysqlRepository>();

  @observable
  MySqlConnection conn;

  _MysqlRepositoryControllerBase() {
    getConnection();
  }

  Future<MySqlConnection> getConnection() async {
    if (conn == null) {
      conn = await _mysqlRepository.getConnection();
    }
    return conn;
  }
}

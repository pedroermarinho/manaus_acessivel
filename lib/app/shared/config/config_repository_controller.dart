import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/myql_model.dart';
import 'package:manausacessivel/app/shared/config/repository/config_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'config_repository_controller.g.dart';

class ConfigRepositoryController = _ConfigRepositoryControllerBase
    with _$ConfigRepositoryController;

abstract class _ConfigRepositoryControllerBase with Store {
  final _configRepository = Modular.get<IConfigRepository>();

  @observable
  MysqlModel mysql;

  @action
  setMysql(MysqlModel value) => mysql = value;

  _ConfigRepositoryControllerBase() {
//    getMysql();//
  }

  Future<MysqlModel> getMysql() async {
    if (mysql == null) {
      String mysql = await _configRepository.getMysql();
      print(mysql);
      Map<String, dynamic> data = json.decode(mysql);
      MysqlModel modelLocal = MysqlModel(
        user: data["user"],
        password: data["password"],
        database: data["database"],
        host: data["host"],
        port: int.parse(data["port"]),
        prefix: data["prefix"],
      );
      setMysql(modelLocal);
    }
    return mysql;
  }
}

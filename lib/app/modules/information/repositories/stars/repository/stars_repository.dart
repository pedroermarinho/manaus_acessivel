import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/myql_model.dart';
import 'package:manausacessivel/app/modules/information/models/stars_model.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';
import 'package:manausacessivel/app/shared/config/config_repository_controller.dart';
import 'package:manausacessivel/app/shared/mysql/mysql_repository_controller.dart';
import 'package:mysql1/mysql1.dart';

import 'stars_repository_interface.dart';

class StarsRepository implements IStarsRepository {
  final _authRepositoryController = Modular.get<AuthRepositoryController>();

  final  _mysqlRepositoryController = Modular.get<MysqlRepositoryController>();

  MySqlConnection conn;

  /// A conexão é encerrada automaticamente


  StarsRepository() {
    connection();
  }

  /// Conectar ao banco de dados
  ///
  /// As informações de conexão estão localizadas no banco do firebase
  connection() async {
    conn = _mysqlRepositoryController.conn;
  }

  @override
  Future<Results> deleteAllStars(String idMarker) async {
    Results results = await conn.query(
      'DELETE FROM `stars` WHERE idMarker = ?',
      [idMarker],
    );
    return results;
  }

  @override
  Future<Results> deleteStars(StarsModel stars) async {
    Results results = await conn.query(
      'DELETE FROM `comment` WHERE idstars = ?',
      [stars.idStars],
    );
    return results;
  }

  @override
  Future<Results> getStars(String idMarker) async {
    print(conn.toString());
    final user = _authRepositoryController.userAuth;
    Results results = await conn.query(
      'SELECT * FROM `stars` WHERE idStars = ?',
      [user.uid+idMarker],
    );
    return results;
  }

  @override
  Future<Results> saveStars(StarsModel stars) async {
    Results results = await conn.query(
      'INSERT INTO `stars`(`idStars`,`idUser`, `idMarker`, `stars`) '
      'VALUES (?,?,?,?)',
      [
        stars.idUser+stars.idMarker,
        stars.idUser,
        stars.idMarker,
        stars.stars,
      ],
    );
    return results;
  }
}

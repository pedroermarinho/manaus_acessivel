import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';
import 'package:manausacessivel/app/models/myql_model.dart';
import 'package:manausacessivel/app/shared/config/config_repository_controller.dart';
import 'package:mysql1/mysql1.dart';

import 'comment_repository_interface.dart';

class CommentRepository implements ICommentRepository {
  final _configRepositoryController = Modular.get<ConfigRepositoryController>();

  MySqlConnection conn;

  /// A conexão é encerrada automaticamente
  @override
  void dispose() {
    if(conn !=null){
      conn.close();
    }
  }

  CommentRepository() {
    connection();
  }

  /// Conectar ao banco de dados
  ///
  /// As informações de conexão estão localizadas no banco do firebase
  connection() async {
    MysqlModel mysql = await _configRepositoryController.getMysql();
    conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: mysql.host,
        port: mysql.port,
        user: mysql.user,
        db: mysql.database,
        password: mysql.password,
      ),
    );
  }

  @override
  Future<Results> deleteAllComment(String idMarker) async {
    Results results = await conn.query(
      'DELETE FROM `comment` WHERE idMarker = ?',
      [idMarker],
    );
    return results;
  }

  @override
  Future<Results> deleteComment(CommentModel comment) async {
    Results results = await conn.query(
      'DELETE FROM `comment` WHERE idComment = ?',
      [comment.idComment],
    );
    return results;
  }

  @override
  Future<Results> getComments(String idMarker) async {
    Results results = await conn.query(
      'SELECT * FROM `comment` WHERE idMarker = ?',
      [idMarker],
    );
    return results;
  }

  @override
  Future<Results> saveComment(CommentModel comment) async {
    Results results = await conn.query(
      'INSERT INTO `comment`(`idUser`, `idMarker`, `comment`, `dateTime`) '
      'VALUES (?,?,?,?,?)',
      [
        comment.idUser,
        comment.idMarker,
        comment.comment,
        comment.dateTime,
      ],
    );
    return results;
  }
}

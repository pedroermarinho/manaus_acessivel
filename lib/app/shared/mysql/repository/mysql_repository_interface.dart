import 'package:flutter_modular/flutter_modular.dart';
import 'package:mysql1/mysql1.dart';

abstract class IMysqlRepository extends Disposable {
  Future<MySqlConnection> getConnection();
}

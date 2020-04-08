// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigRepositoryController on _ConfigRepositoryControllerBase, Store {
  final _$mysqlAtom = Atom(name: '_ConfigRepositoryControllerBase.mysql');

  @override
  MysqlModel get mysql {
    _$mysqlAtom.context.enforceReadPolicy(_$mysqlAtom);
    _$mysqlAtom.reportObserved();
    return super.mysql;
  }

  @override
  set mysql(MysqlModel value) {
    _$mysqlAtom.context.conditionallyRunInAction(() {
      super.mysql = value;
      _$mysqlAtom.reportChanged();
    }, _$mysqlAtom, name: '${_$mysqlAtom.name}_set');
  }

  final _$_ConfigRepositoryControllerBaseActionController =
      ActionController(name: '_ConfigRepositoryControllerBase');

  @override
  dynamic setMysql(MysqlModel value) {
    final _$actionInfo =
        _$_ConfigRepositoryControllerBaseActionController.startAction();
    try {
      return super.setMysql(value);
    } finally {
      _$_ConfigRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'mysql: ${mysql.toString()}';
    return '{$string}';
  }
}

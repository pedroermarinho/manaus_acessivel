// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserRepositoryController on _UserRepositoryControllerBase, Store {
  final _$userAtom = Atom(name: '_UserRepositoryControllerBase.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$_UserRepositoryControllerBaseActionController =
      ActionController(name: '_UserRepositoryControllerBase');

  @override
  dynamic setUser(User value) {
    final _$actionInfo =
        _$_UserRepositoryControllerBaseActionController.startAction();
    try {
      return super.setUser(value);
    } finally {
      _$_UserRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'user: ${user.toString()}';
    return '{$string}';
  }
}

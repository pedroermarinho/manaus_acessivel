// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$userAuthAtom = Atom(name: '_AuthControllerBase.userAuth');

  @override
  FirebaseUser get userAuth {
    _$userAuthAtom.context.enforceReadPolicy(_$userAuthAtom);
    _$userAuthAtom.reportObserved();
    return super.userAuth;
  }

  @override
  set userAuth(FirebaseUser value) {
    _$userAuthAtom.context.conditionallyRunInAction(() {
      super.userAuth = value;
      _$userAuthAtom.reportChanged();
    }, _$userAuthAtom, name: '${_$userAuthAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUser(FirebaseUser value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'userAuth: ${userAuth.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}

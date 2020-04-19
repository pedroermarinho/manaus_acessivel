// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$userAtom = Atom(name: '_SettingsControllerBase.user');

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

  final _$loadingAtom = Atom(name: '_SettingsControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$imagesAtom = Atom(name: '_SettingsControllerBase.images');

  @override
  File get images {
    _$imagesAtom.context.enforceReadPolicy(_$imagesAtom);
    _$imagesAtom.reportObserved();
    return super.images;
  }

  @override
  set images(File value) {
    _$imagesAtom.context.conditionallyRunInAction(() {
      super.images = value;
      _$imagesAtom.reportChanged();
    }, _$imagesAtom, name: '${_$imagesAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_SettingsControllerBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_SettingsControllerBaseActionController =
      ActionController(name: '_SettingsControllerBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo =
        _$_SettingsControllerBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'user: ${user.toString()},loading: ${loading.toString()},images: ${images.toString()},name: ${name.toString()}';
    return '{$string}';
  }
}

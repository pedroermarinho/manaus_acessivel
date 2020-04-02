// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AboutController on _AboutControllerBase, Store {
  final _$appNameAtom = Atom(name: '_AboutControllerBase.appName');

  @override
  String get appName {
    _$appNameAtom.context.enforceReadPolicy(_$appNameAtom);
    _$appNameAtom.reportObserved();
    return super.appName;
  }

  @override
  set appName(String value) {
    _$appNameAtom.context.conditionallyRunInAction(() {
      super.appName = value;
      _$appNameAtom.reportChanged();
    }, _$appNameAtom, name: '${_$appNameAtom.name}_set');
  }

  final _$packageNameAtom = Atom(name: '_AboutControllerBase.packageName');

  @override
  String get packageName {
    _$packageNameAtom.context.enforceReadPolicy(_$packageNameAtom);
    _$packageNameAtom.reportObserved();
    return super.packageName;
  }

  @override
  set packageName(String value) {
    _$packageNameAtom.context.conditionallyRunInAction(() {
      super.packageName = value;
      _$packageNameAtom.reportChanged();
    }, _$packageNameAtom, name: '${_$packageNameAtom.name}_set');
  }

  final _$versionAtom = Atom(name: '_AboutControllerBase.version');

  @override
  String get version {
    _$versionAtom.context.enforceReadPolicy(_$versionAtom);
    _$versionAtom.reportObserved();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.context.conditionallyRunInAction(() {
      super.version = value;
      _$versionAtom.reportChanged();
    }, _$versionAtom, name: '${_$versionAtom.name}_set');
  }

  final _$buildNumberAtom = Atom(name: '_AboutControllerBase.buildNumber');

  @override
  String get buildNumber {
    _$buildNumberAtom.context.enforceReadPolicy(_$buildNumberAtom);
    _$buildNumberAtom.reportObserved();
    return super.buildNumber;
  }

  @override
  set buildNumber(String value) {
    _$buildNumberAtom.context.conditionallyRunInAction(() {
      super.buildNumber = value;
      _$buildNumberAtom.reportChanged();
    }, _$buildNumberAtom, name: '${_$buildNumberAtom.name}_set');
  }

  final _$nameDevelopAtom = Atom(name: '_AboutControllerBase.nameDevelop');

  @override
  String get nameDevelop {
    _$nameDevelopAtom.context.enforceReadPolicy(_$nameDevelopAtom);
    _$nameDevelopAtom.reportObserved();
    return super.nameDevelop;
  }

  @override
  set nameDevelop(String value) {
    _$nameDevelopAtom.context.conditionallyRunInAction(() {
      super.nameDevelop = value;
      _$nameDevelopAtom.reportChanged();
    }, _$nameDevelopAtom, name: '${_$nameDevelopAtom.name}_set');
  }

  final _$recoverInformationAsyncAction = AsyncAction('recoverInformation');

  @override
  Future recoverInformation() {
    return _$recoverInformationAsyncAction
        .run(() => super.recoverInformation());
  }

  @override
  String toString() {
    final string =
        'appName: ${appName.toString()},packageName: ${packageName.toString()},version: ${version.toString()},buildNumber: ${buildNumber.toString()},nameDevelop: ${nameDevelop.toString()}';
    return '{$string}';
  }
}

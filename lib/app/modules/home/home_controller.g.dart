// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$itensMenuAtom = Atom(name: '_HomeControllerBase.itensMenu');

  @override
  List<String> get itensMenu {
    _$itensMenuAtom.context.enforceReadPolicy(_$itensMenuAtom);
    _$itensMenuAtom.reportObserved();
    return super.itensMenu;
  }

  @override
  set itensMenu(List<String> value) {
    _$itensMenuAtom.context.conditionallyRunInAction(() {
      super.itensMenu = value;
      _$itensMenuAtom.reportChanged();
    }, _$itensMenuAtom, name: '${_$itensMenuAtom.name}_set');
  }

  final _$contextAtom = Atom(name: '_HomeControllerBase.context');

  @override
  BuildContext get context {
    _$contextAtom.context.enforceReadPolicy(_$contextAtom);
    _$contextAtom.reportObserved();
    return super.context;
  }

  @override
  set context(BuildContext value) {
    _$contextAtom.context.conditionallyRunInAction(() {
      super.context = value;
      _$contextAtom.reportChanged();
    }, _$contextAtom, name: '${_$contextAtom.name}_set');
  }

  final _$addressAtom = Atom(name: '_HomeControllerBase.address');

  @override
  String get address {
    _$addressAtom.context.enforceReadPolicy(_$addressAtom);
    _$addressAtom.reportObserved();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.context.conditionallyRunInAction(() {
      super.address = value;
      _$addressAtom.reportChanged();
    }, _$addressAtom, name: '${_$addressAtom.name}_set');
  }

  final _$listWidgetOptionsAddressAtom =
      Atom(name: '_HomeControllerBase.listWidgetOptionsAddress');

  @override
  ObservableList<Widget> get listWidgetOptionsAddress {
    _$listWidgetOptionsAddressAtom.context
        .enforceReadPolicy(_$listWidgetOptionsAddressAtom);
    _$listWidgetOptionsAddressAtom.reportObserved();
    return super.listWidgetOptionsAddress;
  }

  @override
  set listWidgetOptionsAddress(ObservableList<Widget> value) {
    _$listWidgetOptionsAddressAtom.context.conditionallyRunInAction(() {
      super.listWidgetOptionsAddress = value;
      _$listWidgetOptionsAddressAtom.reportChanged();
    }, _$listWidgetOptionsAddressAtom,
        name: '${_$listWidgetOptionsAddressAtom.name}_set');
  }

  final _$optionsAddressAsyncAction = AsyncAction('optionsAddress');

  @override
  Future optionsAddress(String address) {
    return _$optionsAddressAsyncAction.run(() => super.optionsAddress(address));
  }

  @override
  String toString() {
    final string =
        'itensMenu: ${itensMenu.toString()},context: ${context.toString()},address: ${address.toString()},listWidgetOptionsAddress: ${listWidgetOptionsAddress.toString()}';
    return '{$string}';
  }
}

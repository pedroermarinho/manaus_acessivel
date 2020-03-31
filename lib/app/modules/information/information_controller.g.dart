// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InformationController on _InformationControllerBase, Store {
  final _$marcadorAtom = Atom(name: '_InformationControllerBase.marcador');

  @override
  Marcador get marcador {
    _$marcadorAtom.context.enforceReadPolicy(_$marcadorAtom);
    _$marcadorAtom.reportObserved();
    return super.marcador;
  }

  @override
  set marcador(Marcador value) {
    _$marcadorAtom.context.conditionallyRunInAction(() {
      super.marcador = value;
      _$marcadorAtom.reportChanged();
    }, _$marcadorAtom, name: '${_$marcadorAtom.name}_set');
  }

  final _$itensMenuAtom = Atom(name: '_InformationControllerBase.itensMenu');

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

  final _$iconsAssListAtom =
      Atom(name: '_InformationControllerBase.iconsAssList');

  @override
  ObservableList<Widget> get iconsAssList {
    _$iconsAssListAtom.context.enforceReadPolicy(_$iconsAssListAtom);
    _$iconsAssListAtom.reportObserved();
    return super.iconsAssList;
  }

  @override
  set iconsAssList(ObservableList<Widget> value) {
    _$iconsAssListAtom.context.conditionallyRunInAction(() {
      super.iconsAssList = value;
      _$iconsAssListAtom.reportChanged();
    }, _$iconsAssListAtom, name: '${_$iconsAssListAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_InformationControllerBase.loading');

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

  final _$placemarkAtom = Atom(name: '_InformationControllerBase.placemark');

  @override
  Placemark get placemark {
    _$placemarkAtom.context.enforceReadPolicy(_$placemarkAtom);
    _$placemarkAtom.reportObserved();
    return super.placemark;
  }

  @override
  set placemark(Placemark value) {
    _$placemarkAtom.context.conditionallyRunInAction(() {
      super.placemark = value;
      _$placemarkAtom.reportChanged();
    }, _$placemarkAtom, name: '${_$placemarkAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'marcador: ${marcador.toString()},itensMenu: ${itensMenu.toString()},iconsAssList: ${iconsAssList.toString()},loading: ${loading.toString()},placemark: ${placemark.toString()}';
    return '{$string}';
  }
}

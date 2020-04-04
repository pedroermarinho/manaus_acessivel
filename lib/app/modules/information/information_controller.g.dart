// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InformationController on _InformationControllerBase, Store {
  final _$userMarkerAtom = Atom(name: '_InformationControllerBase.userMarker');

  @override
  User get userMarker {
    _$userMarkerAtom.context.enforceReadPolicy(_$userMarkerAtom);
    _$userMarkerAtom.reportObserved();
    return super.userMarker;
  }

  @override
  set userMarker(User value) {
    _$userMarkerAtom.context.conditionallyRunInAction(() {
      super.userMarker = value;
      _$userMarkerAtom.reportChanged();
    }, _$userMarkerAtom, name: '${_$userMarkerAtom.name}_set');
  }

  final _$markerAtom = Atom(name: '_InformationControllerBase.marker');

  @override
  MarkerModel get marker {
    _$markerAtom.context.enforceReadPolicy(_$markerAtom);
    _$markerAtom.reportObserved();
    return super.marker;
  }

  @override
  set marker(MarkerModel value) {
    _$markerAtom.context.conditionallyRunInAction(() {
      super.marker = value;
      _$markerAtom.reportChanged();
    }, _$markerAtom, name: '${_$markerAtom.name}_set');
  }

  final _$itemsMenuAtom = Atom(name: '_InformationControllerBase.itemsMenu');

  @override
  List<String> get itemsMenu {
    _$itemsMenuAtom.context.enforceReadPolicy(_$itemsMenuAtom);
    _$itemsMenuAtom.reportObserved();
    return super.itemsMenu;
  }

  @override
  set itemsMenu(List<String> value) {
    _$itemsMenuAtom.context.conditionallyRunInAction(() {
      super.itemsMenu = value;
      _$itemsMenuAtom.reportChanged();
    }, _$itemsMenuAtom, name: '${_$itemsMenuAtom.name}_set');
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

  final _$getUserMarkerAsyncAction = AsyncAction('getUserMarker');

  @override
  Future getUserMarker() {
    return _$getUserMarkerAsyncAction.run(() => super.getUserMarker());
  }

  @override
  String toString() {
    final string =
        'userMarker: ${userMarker.toString()},marker: ${marker.toString()},itemsMenu: ${itemsMenu.toString()},iconsAssList: ${iconsAssList.toString()},loading: ${loading.toString()},placemark: ${placemark.toString()}';
    return '{$string}';
  }
}

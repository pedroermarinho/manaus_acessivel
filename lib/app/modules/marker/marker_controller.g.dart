// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarkerController on _MarkerControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$nameAtom = Atom(name: '_MarkerControllerBase.name');

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

  final _$descriptionAtom = Atom(name: '_MarkerControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$dmAtom = Atom(name: '_MarkerControllerBase.dm');

  @override
  bool get dm {
    _$dmAtom.context.enforceReadPolicy(_$dmAtom);
    _$dmAtom.reportObserved();
    return super.dm;
  }

  @override
  set dm(bool value) {
    _$dmAtom.context.conditionallyRunInAction(() {
      super.dm = value;
      _$dmAtom.reportChanged();
    }, _$dmAtom, name: '${_$dmAtom.name}_set');
  }

  final _$dvAtom = Atom(name: '_MarkerControllerBase.dv');

  @override
  bool get dv {
    _$dvAtom.context.enforceReadPolicy(_$dvAtom);
    _$dvAtom.reportObserved();
    return super.dv;
  }

  @override
  set dv(bool value) {
    _$dvAtom.context.conditionallyRunInAction(() {
      super.dv = value;
      _$dvAtom.reportChanged();
    }, _$dvAtom, name: '${_$dvAtom.name}_set');
  }

  final _$daAtom = Atom(name: '_MarkerControllerBase.da');

  @override
  bool get da {
    _$daAtom.context.enforceReadPolicy(_$daAtom);
    _$daAtom.reportObserved();
    return super.da;
  }

  @override
  set da(bool value) {
    _$daAtom.context.conditionallyRunInAction(() {
      super.da = value;
      _$daAtom.reportChanged();
    }, _$daAtom, name: '${_$daAtom.name}_set');
  }

  final _$diAtom = Atom(name: '_MarkerControllerBase.di');

  @override
  bool get di {
    _$diAtom.context.enforceReadPolicy(_$diAtom);
    _$diAtom.reportObserved();
    return super.di;
  }

  @override
  set di(bool value) {
    _$diAtom.context.conditionallyRunInAction(() {
      super.di = value;
      _$diAtom.reportChanged();
    }, _$diAtom, name: '${_$diAtom.name}_set');
  }

  final _$markerAtom = Atom(name: '_MarkerControllerBase.marker');

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

  final _$selectedMarkerAtom =
      Atom(name: '_MarkerControllerBase.selectedMarker');

  @override
  TypeMarker get selectedMarker {
    _$selectedMarkerAtom.context.enforceReadPolicy(_$selectedMarkerAtom);
    _$selectedMarkerAtom.reportObserved();
    return super.selectedMarker;
  }

  @override
  set selectedMarker(TypeMarker value) {
    _$selectedMarkerAtom.context.conditionallyRunInAction(() {
      super.selectedMarker = value;
      _$selectedMarkerAtom.reportChanged();
    }, _$selectedMarkerAtom, name: '${_$selectedMarkerAtom.name}_set');
  }

  final _$dropdownMenuItemsAtom =
      Atom(name: '_MarkerControllerBase.dropdownMenuItems');

  @override
  ObservableList<DropdownMenuItem<TypeMarker>> get dropdownMenuItems {
    _$dropdownMenuItemsAtom.context.enforceReadPolicy(_$dropdownMenuItemsAtom);
    _$dropdownMenuItemsAtom.reportObserved();
    return super.dropdownMenuItems;
  }

  @override
  set dropdownMenuItems(ObservableList<DropdownMenuItem<TypeMarker>> value) {
    _$dropdownMenuItemsAtom.context.conditionallyRunInAction(() {
      super.dropdownMenuItems = value;
      _$dropdownMenuItemsAtom.reportChanged();
    }, _$dropdownMenuItemsAtom, name: '${_$dropdownMenuItemsAtom.name}_set');
  }

  final _$dropdownMenuValueAtom =
      Atom(name: '_MarkerControllerBase.dropdownMenuValue');

  @override
  DropdownMenuItem<TypeMarker> get dropdownMenuValue {
    _$dropdownMenuValueAtom.context.enforceReadPolicy(_$dropdownMenuValueAtom);
    _$dropdownMenuValueAtom.reportObserved();
    return super.dropdownMenuValue;
  }

  @override
  set dropdownMenuValue(DropdownMenuItem<TypeMarker> value) {
    _$dropdownMenuValueAtom.context.conditionallyRunInAction(() {
      super.dropdownMenuValue = value;
      _$dropdownMenuValueAtom.reportChanged();
    }, _$dropdownMenuValueAtom, name: '${_$dropdownMenuValueAtom.name}_set');
  }

  final _$messageErrorAtom = Atom(name: '_MarkerControllerBase.messageError');

  @override
  String get messageError {
    _$messageErrorAtom.context.enforceReadPolicy(_$messageErrorAtom);
    _$messageErrorAtom.reportObserved();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.context.conditionallyRunInAction(() {
      super.messageError = value;
      _$messageErrorAtom.reportChanged();
    }, _$messageErrorAtom, name: '${_$messageErrorAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_MarkerControllerBase.loading');

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

  final _$positionAtom = Atom(name: '_MarkerControllerBase.position');

  @override
  Position get position {
    _$positionAtom.context.enforceReadPolicy(_$positionAtom);
    _$positionAtom.reportObserved();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.context.conditionallyRunInAction(() {
      super.position = value;
      _$positionAtom.reportChanged();
    }, _$positionAtom, name: '${_$positionAtom.name}_set');
  }

  final _$_MarkerControllerBaseActionController =
      ActionController(name: '_MarkerControllerBase');

  @override
  dynamic setDm(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDm(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDv(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDv(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDa(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDa(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDi(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDi(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescrcao(String value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDescrcao(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarker(MarkerModel value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setMarker(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedMarker(TypeMarker value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setSelectedMarker(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPosition(Position value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setPosition(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},description: ${description.toString()},dm: ${dm.toString()},dv: ${dv.toString()},da: ${da.toString()},di: ${di.toString()},marker: ${marker.toString()},selectedMarker: ${selectedMarker.toString()},dropdownMenuItems: ${dropdownMenuItems.toString()},dropdownMenuValue: ${dropdownMenuValue.toString()},messageError: ${messageError.toString()},loading: ${loading.toString()},position: ${position.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_map_custom_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoogleMapCustomController on _GoogleMapCustomControllerBase, Store {
  final _$googleMapCompleterAtom =
      Atom(name: '_GoogleMapCustomControllerBase.googleMapCompleter');

  @override
  Completer<GoogleMapController> get googleMapCompleter {
    _$googleMapCompleterAtom.context
        .enforceReadPolicy(_$googleMapCompleterAtom);
    _$googleMapCompleterAtom.reportObserved();
    return super.googleMapCompleter;
  }

  @override
  set googleMapCompleter(Completer<GoogleMapController> value) {
    _$googleMapCompleterAtom.context.conditionallyRunInAction(() {
      super.googleMapCompleter = value;
      _$googleMapCompleterAtom.reportChanged();
    }, _$googleMapCompleterAtom, name: '${_$googleMapCompleterAtom.name}_set');
  }

  final _$markersAtom = Atom(name: '_GoogleMapCustomControllerBase.markers');

  @override
  ObservableMap<String, Marker> get markers {
    _$markersAtom.context.enforceReadPolicy(_$markersAtom);
    _$markersAtom.reportObserved();
    return super.markers;
  }

  @override
  set markers(ObservableMap<String, Marker> value) {
    _$markersAtom.context.conditionallyRunInAction(() {
      super.markers = value;
      _$markersAtom.reportChanged();
    }, _$markersAtom, name: '${_$markersAtom.name}_set');
  }

  final _$locationMarkerAtom =
      Atom(name: '_GoogleMapCustomControllerBase.locationMarker');

  @override
  Position get locationMarker {
    _$locationMarkerAtom.context.enforceReadPolicy(_$locationMarkerAtom);
    _$locationMarkerAtom.reportObserved();
    return super.locationMarker;
  }

  @override
  set locationMarker(Position value) {
    _$locationMarkerAtom.context.conditionallyRunInAction(() {
      super.locationMarker = value;
      _$locationMarkerAtom.reportChanged();
    }, _$locationMarkerAtom, name: '${_$locationMarkerAtom.name}_set');
  }

  final _$positionActualAtom =
      Atom(name: '_GoogleMapCustomControllerBase.positionActual');

  @override
  Position get positionActual {
    _$positionActualAtom.context.enforceReadPolicy(_$positionActualAtom);
    _$positionActualAtom.reportObserved();
    return super.positionActual;
  }

  @override
  set positionActual(Position value) {
    _$positionActualAtom.context.conditionallyRunInAction(() {
      super.positionActual = value;
      _$positionActualAtom.reportChanged();
    }, _$positionActualAtom, name: '${_$positionActualAtom.name}_set');
  }

  final _$contextAtom = Atom(name: '_GoogleMapCustomControllerBase.context');

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

  final _$cameraPositionAtom =
      Atom(name: '_GoogleMapCustomControllerBase.cameraPosition');

  @override
  CameraPosition get cameraPosition {
    _$cameraPositionAtom.context.enforceReadPolicy(_$cameraPositionAtom);
    _$cameraPositionAtom.reportObserved();
    return super.cameraPosition;
  }

  @override
  set cameraPosition(CameraPosition value) {
    _$cameraPositionAtom.context.conditionallyRunInAction(() {
      super.cameraPosition = value;
      _$cameraPositionAtom.reportChanged();
    }, _$cameraPositionAtom, name: '${_$cameraPositionAtom.name}_set');
  }

  final _$viewMarkerAsyncAction = AsyncAction('viewMarker');

  @override
  Future viewMarker(Marcador marker) {
    return _$viewMarkerAsyncAction.run(() => super.viewMarker(marker));
  }

  final _$exibirMarcadorLocalizacaoAsyncAction =
      AsyncAction('exibirMarcadorLocalizacao');

  @override
  Future exibirMarcadorLocalizacao(Position position) {
    return _$exibirMarcadorLocalizacaoAsyncAction
        .run(() => super.exibirMarcadorLocalizacao(position));
  }

  final _$recuperarLocaizacaoPositionAsyncAction =
      AsyncAction('recuperarLocaizacaoPosition');

  @override
  Future recuperarLocaizacaoPosition(Position position) {
    return _$recuperarLocaizacaoPositionAsyncAction
        .run(() => super.recuperarLocaizacaoPosition(position));
  }

  final _$novaLocalizacaoAsyncAction = AsyncAction('novaLocalizacao');

  @override
  Future novaLocalizacao(String address) {
    return _$novaLocalizacaoAsyncAction
        .run(() => super.novaLocalizacao(address));
  }

  final _$novaLocalizacaoPlacemarkAsyncAction =
      AsyncAction('novaLocalizacaoPlacemark');

  @override
  Future novaLocalizacaoPlacemark(Placemark address) {
    return _$novaLocalizacaoPlacemarkAsyncAction
        .run(() => super.novaLocalizacaoPlacemark(address));
  }

  final _$_GoogleMapCustomControllerBaseActionController =
      ActionController(name: '_GoogleMapCustomControllerBase');

  @override
  dynamic setPositionActual(Position value) {
    final _$actionInfo =
        _$_GoogleMapCustomControllerBaseActionController.startAction();
    try {
      return super.setPositionActual(value);
    } finally {
      _$_GoogleMapCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCameraPosition(Position value) {
    final _$actionInfo =
        _$_GoogleMapCustomControllerBaseActionController.startAction();
    try {
      return super.setCameraPosition(value);
    } finally {
      _$_GoogleMapCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarkers(Marker value) {
    final _$actionInfo =
        _$_GoogleMapCustomControllerBaseActionController.startAction();
    try {
      return super.setMarkers(value);
    } finally {
      _$_GoogleMapCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onMapCreated(GoogleMapController googleMapController) {
    final _$actionInfo =
        _$_GoogleMapCustomControllerBaseActionController.startAction();
    try {
      return super.onMapCreated(googleMapController);
    } finally {
      _$_GoogleMapCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic adiconarListenerLocalizacao() {
    final _$actionInfo =
        _$_GoogleMapCustomControllerBaseActionController.startAction();
    try {
      return super.adiconarListenerLocalizacao();
    } finally {
      _$_GoogleMapCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'googleMapCompleter: ${googleMapCompleter.toString()},markers: ${markers.toString()},locationMarker: ${locationMarker.toString()},positionActual: ${positionActual.toString()},context: ${context.toString()},cameraPosition: ${cameraPosition.toString()}';
    return '{$string}';
  }
}

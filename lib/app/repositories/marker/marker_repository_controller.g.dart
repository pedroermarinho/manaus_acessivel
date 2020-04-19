// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarkerRepositoryController on _MarkerRepositoryControllerBase, Store {
  final _$markerAtom = Atom(name: '_MarkerRepositoryControllerBase.marker');

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

  final _$markerListAtom =
      Atom(name: '_MarkerRepositoryControllerBase.markerList');

  @override
  ObservableList<MarkerModel> get markerList {
    _$markerListAtom.context.enforceReadPolicy(_$markerListAtom);
    _$markerListAtom.reportObserved();
    return super.markerList;
  }

  @override
  set markerList(ObservableList<MarkerModel> value) {
    _$markerListAtom.context.conditionallyRunInAction(() {
      super.markerList = value;
      _$markerListAtom.reportChanged();
    }, _$markerListAtom, name: '${_$markerListAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_MarkerRepositoryControllerBase.loading');

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

  final _$setMarkersAsyncAction = AsyncAction('setMarkers');

  @override
  Future setMarkers(ObservableList<MarkerModel> value) {
    return _$setMarkersAsyncAction.run(() => super.setMarkers(value));
  }

  final _$_MarkerRepositoryControllerBaseActionController =
      ActionController(name: '_MarkerRepositoryControllerBase');

  @override
  dynamic setMarker(MarkerModel value) {
    final _$actionInfo =
        _$_MarkerRepositoryControllerBaseActionController.startAction();
    try {
      return super.setMarker(value);
    } finally {
      _$_MarkerRepositoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'marker: ${marker.toString()},markerList: ${markerList.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_marker_repository_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TypeMarkerRepositoryController
    on _TypeMarkerRepositoryControllerBase, Store {
  final _$typeMarkerAtom =
      Atom(name: '_TypeMarkerRepositoryControllerBase.typeMarker');

  @override
  TypeMarker get typeMarker {
    _$typeMarkerAtom.context.enforceReadPolicy(_$typeMarkerAtom);
    _$typeMarkerAtom.reportObserved();
    return super.typeMarker;
  }

  @override
  set typeMarker(TypeMarker value) {
    _$typeMarkerAtom.context.conditionallyRunInAction(() {
      super.typeMarker = value;
      _$typeMarkerAtom.reportChanged();
    }, _$typeMarkerAtom, name: '${_$typeMarkerAtom.name}_set');
  }

  final _$typeMarkerListAtom =
      Atom(name: '_TypeMarkerRepositoryControllerBase.typeMarkerList');

  @override
  ObservableList<TypeMarker> get typeMarkerList {
    _$typeMarkerListAtom.context.enforceReadPolicy(_$typeMarkerListAtom);
    _$typeMarkerListAtom.reportObserved();
    return super.typeMarkerList;
  }

  @override
  set typeMarkerList(ObservableList<TypeMarker> value) {
    _$typeMarkerListAtom.context.conditionallyRunInAction(() {
      super.typeMarkerList = value;
      _$typeMarkerListAtom.reportChanged();
    }, _$typeMarkerListAtom, name: '${_$typeMarkerListAtom.name}_set');
  }

  final _$getTypeMarkerAsyncAction = AsyncAction('getTypeMarker');

  @override
  Future<TypeMarker> getTypeMarker(String idTypeMarker) {
    return _$getTypeMarkerAsyncAction
        .run(() => super.getTypeMarker(idTypeMarker));
  }

  final _$_TypeMarkerRepositoryControllerBaseActionController =
      ActionController(name: '_TypeMarkerRepositoryControllerBase');

  @override
  dynamic setTypeMarker(TypeMarker value) {
    final _$actionInfo =
        _$_TypeMarkerRepositoryControllerBaseActionController.startAction();
    try {
      return super.setTypeMarker(value);
    } finally {
      _$_TypeMarkerRepositoryControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'typeMarker: ${typeMarker.toString()},typeMarkerList: ${typeMarkerList.toString()}';
    return '{$string}';
  }
}

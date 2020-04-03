import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/type_marker_model.dart';
import 'package:manausacessivel/app/repositories/type_marker/repository/type_marker_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'type_marker_repository_controller.g.dart';

class TypeMarkerRepositoryController = _TypeMarkerRepositoryControllerBase
    with _$TypeMarkerRepositoryController;

abstract class _TypeMarkerRepositoryControllerBase with Store {
  final ITypeMarkerRepository _typeMarkerRepository = Modular.get();

  @observable
  TypeMarker typeMarker;

  @observable
  ObservableList<TypeMarker> typeMarkerList = ObservableList();

  _TypeMarkerRepositoryControllerBase() {
//    getTypeMarked();
  }

  @action
  setTypeMarker(TypeMarker value) => typeMarker = value;

  @action
  Future<TypeMarker> getTypeMarker(String idTypeMarker) async {
    DocumentSnapshot snapshot =
        await _typeMarkerRepository.getTypeMarker(idTypeMarker);

    Map<String, dynamic> data = snapshot.data;

    var typeMarkerLocal = TypeMarker(
      idTypeMarker: snapshot.documentID,
      name: data["name"],
      icon: data["icon"],
    );
    setTypeMarker(typeMarkerLocal);

    return typeMarker;
  }

  Stream<QuerySnapshot> getTypeMarkers() {
    return _typeMarkerRepository.getTypeMarkers();
  }

  Future saveTypeMarker(TypeMarker typeMarker){
    return _typeMarkerRepository.saveTypeMarker(typeMarker);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/type_marker.dart';
import 'package:manausacessivel/app/repositories/type_marker/repository/type_marker_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'type_marker_repository_controller.g.dart';

class TypeMarkerRepositoryController = _TypeMarkerRepositoryControllerBase
    with _$TypeMarkerRepositoryController;

abstract class _TypeMarkerRepositoryControllerBase with Store {
  final ITypeMarkerRepository _typeMarkerRepository = Modular.get();

  @observable
  TypeMarcador typeMarker;

  @observable
  ObservableList<TypeMarcador> typeMarkerList = ObservableList();

  _TypeMarkerRepositoryControllerBase() {
//    getTypeMarked();
  }

  @action
  setUser(String value) async => typeMarker = await getTypeMarker(value);

  Future<TypeMarcador> getTypeMarker(String idTypeMarker) async {
    DocumentSnapshot snapshot =
        await _typeMarkerRepository.getTypeMarker(idTypeMarker);

    Map<String, dynamic> data = snapshot.data;

    typeMarker = TypeMarcador();
    typeMarker.idTypeMarcador = snapshot.documentID;
    typeMarker.nome = data["nome"];
    typeMarker.icon = data["icon"];

    return typeMarker;
  }

  Stream<QuerySnapshot> getTypeMarkers() {
    return _typeMarkerRepository.getTypeMarkers();
  }
}

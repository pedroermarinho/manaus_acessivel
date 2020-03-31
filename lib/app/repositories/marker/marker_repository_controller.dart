import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:manausacessivel/app/models/marker.dart';
import 'package:manausacessivel/app/repositories/marker/repository/marker_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'marker_repository_controller.g.dart';

class MarkerRepositoryController = _MarkerRepositoryControllerBase
    with _$MarkerRepositoryController;

abstract class _MarkerRepositoryControllerBase with Store {
  final IMarkerRepository _markerRepository = Modular.get();

  @observable
  Marcador marker;

  @observable
  ObservableList<Marcador> markerList = ObservableList();

  @observable
  bool loading = false;

  _MarkerRepositoryControllerBase() {
    print("initialized _MarkerRepositoryControllerBase");
    getMarkers();
  }

  @action
  setMarker(Marcador value) async => marker = value;

  @action
  setMarkers(ObservableList<Marcador> value) async => markerList = value;

  Future getMarker(String idMarker) async {
    DocumentSnapshot snapshot = await _markerRepository.getMarker(idMarker);

    Map<String, dynamic> data = snapshot.data;

    marker = Marcador();
    marker.idMarcador = snapshot.documentID;
    marker.idUserCreator = data["idUserCreator"];
    marker.idTypeMarcador = data["idTypeMarcador"];
    marker.title = data["title"];
    marker.descricao = data["descricao"];
    marker.dv = data["dv"];
    marker.da = data["da"];
    marker.di = data["di"];
    marker.dm = data["dm"];
    marker.latitude = data["latitude"];
    marker.longitude = data["longitude"];
    return marker;
  }

  Stream<QuerySnapshot> getMarkers() {
    return _markerRepository.getMarkers();
  }

  Future deleteMarker() {
    return _markerRepository.deleteMarker(marker.idMarcador);
  }

  Future saveMarker() {
    return _markerRepository.saveMarker(marker.toMap());
  }

  Future updateMarker(Marcador marker) {
    return _markerRepository.updateMarker(marker);
  }
}

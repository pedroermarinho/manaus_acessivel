import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/models/type_marker_model.dart';

abstract class ITypeMarkerRepository {
  Future<DocumentSnapshot> getTypeMarker(String idTypeMarker);

  Stream<QuerySnapshot> getTypeMarkers();

  Future saveTypeMarker(TypeMarker typeMarker);
}

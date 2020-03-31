import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ITypeMarkerRepository {
  Future<DocumentSnapshot> getTypeMarker(String idTypeMarker);

  Stream<QuerySnapshot> getTypeMarkers();
}

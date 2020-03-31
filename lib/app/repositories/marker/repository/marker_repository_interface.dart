import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/models/marker.dart';

abstract class IMarkerRepository {
  Future<DocumentSnapshot> getMarker(String idMarker);

  Stream<QuerySnapshot> getMarkers();

  Future deleteMarker(String idMarker);

  Future saveMarker(Map<String, dynamic> marker);

  Future updateMarker(Marcador marker);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/models/marker_model.dart';
import 'package:manausacessivel/app/repositories/marker/repository/marker_repository_interface.dart';

class MarkerRepository implements IMarkerRepository {
  final Firestore _firestore = Firestore.instance;
  final String _collectionDB = "markers";

  @override
  Future deleteMarker(String idMarker) {
    return _firestore.collection(_collectionDB).document(idMarker).delete();
  }

  @override
  Stream<QuerySnapshot> getMarkers() {
    return _firestore.collection(_collectionDB).where("").snapshots();
  }

  @override
  Future<DocumentSnapshot> getMarker(String idMarker) {
    return _firestore.collection(_collectionDB).document(idMarker).get();
  }

  @override
  Stream<QuerySnapshot> getMarkerUser(String idUser) {
    return _firestore
        .collection(_collectionDB)
        .where("idUserCreator", isEqualTo: idUser)
        .snapshots();
  }

  @override
  Future saveMarker(Map<String, dynamic> marker) {
    return _firestore.collection(_collectionDB).document().setData(marker);
  }

  @override
  Future updateMarker(MarkerModel marker) {
    return _firestore
        .collection(_collectionDB)
        .document(marker.idMarker)
        .updateData(marker.toMap());
  }
}

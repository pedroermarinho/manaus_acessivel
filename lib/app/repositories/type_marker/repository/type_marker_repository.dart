import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/repositories/type_marker/repository/type_marker_repository_interface.dart';

class TypeMarkerRepository implements ITypeMarkerRepository {
  final Firestore _firestore = Firestore.instance;
  final String _collectionDB = "typemarkers";

  @override
  Stream<QuerySnapshot> getTypeMarkers() {
    return _firestore.collection(_collectionDB).where("").snapshots();
  }

  @override
  Future<DocumentSnapshot> getTypeMarker(String idTypeMarker) {
    return _firestore.collection(_collectionDB).document(idTypeMarker).get();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/stars_model.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';

import 'stars_repository_interface.dart';

class StarsRepository implements IStarsRepository {
  final Firestore _firestore = Firestore.instance;
  final String _collectionDB = "stars";
  final _authController = Modular.get<AuthRepositoryController>();

  @override
  deleteAllStars(String idMarker) {
    _firestore
        .collection(_collectionDB)
        .where("idMarker", isEqualTo: idMarker)
        .snapshots()
        .listen((event) {
      event.documents.forEach((element) {
        deleteStars(element.data["idStars"]);
      });
    });
  }

  @override
  Future deleteStars(String idStars) {
    return _firestore.collection(_collectionDB).document(idStars).delete();
  }

  @override
  Stream<QuerySnapshot> getStars(String idMarker) {
    return _firestore
        .collection(_collectionDB)
        .where("idMarker", isEqualTo: idMarker)
        .snapshots();
  }

  @override
  Future<DocumentSnapshot> getStarsUser(String idMarker) {
    return _firestore
        .collection(_collectionDB)
        .document(idMarker + _authController.userAuth.uid)
        .get();
  }

  @override
  Future saveStars(StarsModel stars) {
    return _firestore
        .collection(_collectionDB)
        .document(stars.idMarker + _authController.userAuth.uid)
        .setData(stars.toMap());
  }

  @override
  Future updateStars(StarsModel stars) {
    return _firestore
        .collection(_collectionDB)
        .document(stars.idMarker + _authController.userAuth.uid)
        .updateData(stars.toMap());
  }
}

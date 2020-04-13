import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/favorite_model.dart';
import 'package:manausacessivel/app/repositories/favorite/repository/favorite_repository_interface.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';

class FavoriteRepository implements IFavoriteRepository {
  final Firestore _firestore = Firestore.instance;
  final String _collectionDB = "favorite";
  final AuthRepositoryController _authController = Modular.get();

  @override
  Future deleteFavoriteMarker(String idMarker) {
    return _firestore
        .collection(_collectionDB)
        .document(idMarker + _authController.userAuth.uid)
        .delete();
  }

  @override
  Future<DocumentSnapshot> getFavoriteMarker(String idMarker) {
    return _firestore
        .collection(_collectionDB)
        .document(idMarker + _authController.userAuth.uid)
        .get();
  }

  @override
  Stream<QuerySnapshot> getFavoriteMarkers(String idMarker) {
    return _firestore
        .collection(_collectionDB)
        .where("idMarker", isEqualTo: idMarker)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot> getFavoritesUser() {
    return _firestore
        .collection(_collectionDB)
        .where("idUser", isEqualTo: _authController.userAuth.uid)
        .snapshots();
  }

  @override
  Future saveFavoriteMarker(String idMarker) {
    FavoriteModel favoriteModel = FavoriteModel(
      idMarker: idMarker,
      idUser: _authController.userAuth.uid,
    );
    return _firestore
        .collection(_collectionDB)
        .document(idMarker + _authController.userAuth.uid)
        .setData(favoriteModel.toMap());
  }
}

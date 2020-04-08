import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/models/favorite_model.dart';

abstract class IFavoriteRepository {
  /// Retorna o favorito com a relação entre usuario e marcador
  ///
  /// usado para saber se o usuario favoritou ou não um marcador
  Future<DocumentSnapshot> getFavoriteMarker(String idMarker);

  /// Retorna todos os favoritos de um marcador
  ///
  /// usado para contabilizar a quantidades de favoritos um marcador tem
  Stream<QuerySnapshot> getFavoriteMarkers(String idMarker);

  /// Retornas todos os favoritos do usuario
  Stream<QuerySnapshot> getFavoritesUser();

  /// Deleta um favorito
  Future deleteFavoriteMarker(String idMarker);

  /// Salva um novo favorito
  Future saveFavoriteMarker(String idMarker);
}

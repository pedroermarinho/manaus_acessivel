class FavoriteModel {
  String idFavorite;
  String idUser;
  String idMarker;

  FavoriteModel({
    this.idFavorite,
    this.idUser,
    this.idMarker,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"idUser": idUser, "idMarker": idMarker};
    return map;
  }
}

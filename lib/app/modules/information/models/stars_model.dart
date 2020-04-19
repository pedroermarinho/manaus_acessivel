class StarsModel {
  String idStars;
  String idUser;
  String idMarker;
  int stars;

  StarsModel({
    this.idStars,
    this.idUser,
    this.idMarker,
    this.stars,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUser": idUser,
      "idMarker": idMarker,
      "stars": stars,
    };
    return map;
  }
}

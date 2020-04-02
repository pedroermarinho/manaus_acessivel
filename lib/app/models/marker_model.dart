class MarkerModel {
  String idMarker;
  String idTypeMarker;
  String idUserCreator;
  String title;
  String description;
  bool dm;
  bool dv;
  bool da;
  bool di;
  double latitude;
  double longitude;

  MarkerModel({
    this.idMarker,
    this.idTypeMarker,
    this.idUserCreator,
    this.title,
    this.description,
    this.dm,
    this.dv,
    this.da,
    this.di,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idTypeMarker": idTypeMarker,
      "idUserCreator": idUserCreator,
      "title": title,
      "description": description,
      "dm": dm,
      "dv": dv,
      "da": da,
      "di": di,
      "latitude": latitude,
      "longitude": longitude
    };
    return map;
  }
}

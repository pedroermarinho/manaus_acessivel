class TypeMarker {
  String idTypeMarker;
  String name;
  String icon;

  TypeMarker({
    this.idTypeMarker,
    this.name,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": name,
      "icon": icon,
    };
    return map;
  }
}

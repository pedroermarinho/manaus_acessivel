class Marcador {
  String _idMarcador;
  String _idTypeMarcador;
  String _idUserCreator;
  String _title;
  String _icon;
  String _descricao;
  bool _dm;
  bool _dv;
  bool _da;
  bool _di;
  double _latitude;
  double _longitude;

  Marcador();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idTypeMarcador": this.idTypeMarcador,
      "idUserCreator": this.idUserCreator,
      "title": this.title,
      "descricao": this.descricao,
      "dm": this.dm,
      "dv": this.dv,
      "da": this.da,
      "di": this.di,
      "latitude": this.latitude,
      "longitude": this.longitude
    };

    return map;
  }

  String get idUserCreator => _idUserCreator;

  set idUserCreator(String value) {
    _idUserCreator = value;
  }

  bool get di => _di;

  set di(bool value) {
    _di = value;
  }

  bool get da => _da;

  set da(bool value) {
    _da = value;
  }

  bool get dv => _dv;

  set dv(bool value) {
    _dv = value;
  }

  bool get dm => _dm;

  set dm(bool value) {
    _dm = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get idTypeMarcador => _idTypeMarcador;

  set idTypeMarcador(String value) {
    _idTypeMarcador = value;
  }

  String get idMarcador => _idMarcador;

  set idMarcador(String value) {
    _idMarcador = value;
  }

  @override
  String toString() {
    return 'Marcador{_idMarcador: $_idMarcador, _idTypeMarcador: $_idTypeMarcador, _title: $_title, _icon: $_icon, _info: $_descricao, _latitude: $_latitude, _longitude: $_longitude, _dm: $_dm, _dv: $_dv, _da: $_da, _di: $_di}';
  }
}

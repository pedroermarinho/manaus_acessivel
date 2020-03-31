import 'package:cloud_firestore/cloud_firestore.dart';

class TypeMarcador {
  String _idTypeMarcador;
  String _nome;
  String _icon;

  TypeMarcador();

  String get icon => _icon;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"nome": this.nome, "icon": this.icon};

    return map;
  }

  set icon(String value) {
    _icon = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get idTypeMarcador => _idTypeMarcador;

  set idTypeMarcador(String value) {
    _idTypeMarcador = value;
  }
}

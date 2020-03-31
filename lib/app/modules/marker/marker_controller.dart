import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/models/marker.dart';
import 'package:manausacessivel/app/models/type_marker.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'marker_controller.g.dart';

class MarkerController = _MarkerControllerBase with _$MarkerController;

abstract class _MarkerControllerBase with Store {
  final MarkerRepositoryController _markerRepositoryController = Modular.get();
  final TypeMarkerRepositoryController _typeMarkerRepositoryController =
      Modular.get();
  final AuthController _authController = Modular.get();
  final GoogleMapCustomController _googleMapController = Modular.get();

  @observable
  String nome;

  @observable
  String descricao;

  @observable
  bool dm = false; //Deficiência Motora

  @observable
  bool dv = false; //Deficiência Visual

  @observable
  bool da = false; //Deficiência Auditiva

  @observable
  bool di = false; //Deficiência Intelectual

  @action
  setDm(bool value) => dm = value;

  @action
  setDv(bool value) => dv = value;

  @action
  setDa(bool value) => da = value;

  @action
  setDi(bool value) => di = value;

  @action
  setName(String value) => nome = value;

  @action
  setDescrcao(String value) => descricao = value;

  @observable
  Marcador marcador;

  @observable
  TypeMarcador selectedMarcador;

  @action
  setMarker(Marcador value){
    marcador = value;
    editarMarcador();
  }

  @action
  setSelectedMarker(TypeMarcador value) => selectedMarcador = value;

  @observable
  ObservableList<DropdownMenuItem<TypeMarcador>> dropdownMenuItems =
      ObservableList();

  @observable
  DropdownMenuItem<TypeMarcador> dropdownMenuValue;

  @observable
  String mensagemErro = "";

  @observable
  bool carregando = false;

  @observable
  Position position;

  @action
  setPosition(Position value) => position = value;

  _MarkerControllerBase() {
    buildDropdownMenuItems();
    position =_googleMapController.positionActual;
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateDescricao() == null &&
        validateCategoria() == null;
  }

  String validateName() {
    if (nome == null || nome.isEmpty) {
      return "O campo Nome é obrigatório";
    }
    return null;
  }

  String validateDescricao() {
    if (descricao == null || descricao.isEmpty) {
      return "O campo Descrição é obrigatório";
    }
    if (descricao.length < 10) {
      return "A Descrição precisa ter mais de 10 caracteres";
    }
    return null;
  }

  String validateCategoria() {

    String typeMarcadorLocal = selectedMarcador != null ?
    selectedMarcador.idTypeMarcador:null;

    String typeMarcadorGlobal = marcador != null ?
    marcador.idTypeMarcador:null;

    if (typeMarcadorLocal == null && typeMarcadorGlobal == null ) {
      return "O campo Categoria é obrigatório";
    }
    return null;
  }

  validarCampos() async {

    String typeMarcador = selectedMarcador == null
        ? marcador.idTypeMarcador
        : selectedMarcador.idTypeMarcador;

    //validar campos
    if (nome.isNotEmpty) {
      if (descricao.isNotEmpty) {
        if (typeMarcador.isNotEmpty) {
          if (marcador == null) {
            marcador = Marcador();
            marcador.idUserCreator = _authController.userAuth.uid;
            marcador.title = nome;
            marcador.descricao = descricao;
            marcador.idTypeMarcador = typeMarcador;
            marcador.dm = dm;
            marcador.di = di;
            marcador.da = da;
            marcador.dv = dv;
            marcador.longitude=position.longitude;
            marcador.latitude=position.latitude;

            cadastrarMarcador(marcador);
          } else {
            marcador.title = nome;
            marcador.descricao = descricao;
            marcador.idTypeMarcador = typeMarcador;
            marcador.dm = dm;
            marcador.di = di;
            marcador.da = da;
            marcador.dv = dv;
            atualizarMarcador();
          }
        } else {
          mensagemErro = "Selecione uma Categoria";
        }
      } else {
        mensagemErro = "Preencha a Descrição";
      }
    } else {
      mensagemErro = "Preencha o Nome";
    }
  }

  cadastrarMarcador(Marcador marcador) {
    carregando = true;
    _markerRepositoryController.setMarker(marcador);
    _markerRepositoryController.saveMarker().then((value) {
      carregando = false;
      _googleMapController.markers.clear();
      _googleMapController.loadMarkers();
      Modular.to.pop();
    }).catchError((error) {
      print(error);
      carregando = false;
      mensagemErro =
          "Erro ao cadastrar marcador, verifique os campos e tente novamente!";
    });
  }

  atualizarMarcador() {
    carregando = true;
    print(marcador.idMarcador);
    _markerRepositoryController.updateMarker(marcador).then((value) {
      carregando = false;
      _googleMapController.markers.clear();
      _googleMapController.loadMarkers();
      Modular.to.pop();
    }).catchError((error) {
      PlatformException errorException = error;
      print(errorException.code);
      carregando = false;
      mensagemErro =
          "Erro ao atualizar o marcador, verifique os campos e tente novamente!";
    });
  }

  editarMarcador() async {
    if (marcador != null) {
      TypeMarcador typeMarcador = await _typeMarkerRepositoryController
          .getTypeMarker(marcador.idTypeMarcador);

      nome = marcador.title;
      descricao = marcador.descricao;
      dv = marcador.dv;
      da = marcador.da;
      di = marcador.di;
      dm = marcador.dm;

      position = Position(
          longitude: marcador.longitude,
          latitude: marcador.latitude,
        );

      dropdownMenuValue = DropdownMenuItem<TypeMarcador>(
        value: typeMarcador,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/icons/${typeMarcador.icon}.png",
              height: 40,
              width: 40,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                typeMarcador.nome,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }
  }

  buildDropdownMenuItems() {
    Stream<QuerySnapshot> stream =
        _typeMarkerRepositoryController.getTypeMarkers();
    print(stream);
    stream.listen(
      (event) {
        event.documents.forEach(
          (element) {
            Map<String, dynamic> data = element.data;

            TypeMarcador typeMarker = TypeMarcador();
            typeMarker.idTypeMarcador = element.documentID;
            typeMarker.nome = data["nome"];
            typeMarker.icon = data["icon"];

            dropdownMenuItems.add(
              DropdownMenuItem<TypeMarcador>(
                value: typeMarker,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/icons/${typeMarker.icon}.png",
                      height: 40,
                      width: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        typeMarker.nome,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }


}

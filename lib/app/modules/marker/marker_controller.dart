import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/models/marker_model.dart';
import 'package:manausacessivel/app/models/type_marker_model.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';
import 'package:mobx/mobx.dart';

part 'marker_controller.g.dart';

class MarkerController = _MarkerControllerBase with _$MarkerController;

abstract class _MarkerControllerBase with Store {
  final _markerRepositoryController = Modular.get<MarkerRepositoryController>();
  final _typeMarkerRepositoryController =
      Modular.get<TypeMarkerRepositoryController>();
  final _authController = Modular.get<AuthRepositoryController>();
  final _googleMapController = Modular.get<GoogleMapCustomController>();

  @observable
  String name;

  @observable
  String description;

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
  setName(String value) => name = value;

  @action
  setDescrcao(String value) => description = value;

  @observable
  MarkerModel marker;

  @observable
  TypeMarker selectedMarker;

  @action
  setMarker(MarkerModel value) {
    marker = value;
    editMarker();
  }

  @action
  setSelectedMarker(TypeMarker value) => selectedMarker = value;

  @observable
  ObservableList<DropdownMenuItem<TypeMarker>> dropdownMenuItems =
      ObservableList();

  @observable
  DropdownMenuItem<TypeMarker> dropdownMenuValue;

  @observable
  String messageError = "";

  @observable
  bool loading = false;

  @observable
  Position position;

  @action
  setPosition(Position value) => position = value;

  _MarkerControllerBase() {
    buildDropdownMenuItems();
    position = _googleMapController.positionActual;
  }

  @computed
  bool get isValid {
    return validateName() == null &&
        validateDescription() == null &&
        validateCategory() == null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo Nome é obrigatório";
    }
    return null;
  }

  String validateDescription() {
    if (description == null || description.isEmpty) {
      return "O campo Descrição é obrigatório";
    }
    if (description.length < 10) {
      return "A Descrição precisa ter mais de 10 caracteres";
    }
    return null;
  }

  String validateCategory() {
    String typeMarkerLocal =
        selectedMarker != null ? selectedMarker.idTypeMarker : null;

    String typeMarkerGlobal = marker != null ? marker.idTypeMarker : null;

    if (typeMarkerLocal == null && typeMarkerGlobal == null) {
      return "O campo Categoria é obrigatório";
    }
    return null;
  }

  validCampos() async {
    String typeMarker = selectedMarker == null
        ? marker.idTypeMarker
        : selectedMarker.idTypeMarker;

    //validar campos
    if (name.isNotEmpty) {
      if (description.isNotEmpty) {
        if (typeMarker.isNotEmpty) {
          if (marker == null) {
            marker = MarkerModel();
            marker.idUserCreator = _authController.userAuth.uid;
            marker.title = name;
            marker.description = description;
            marker.idTypeMarker = typeMarker;
            marker.dm = dm;
            marker.di = di;
            marker.da = da;
            marker.dv = dv;
            marker.longitude = position.longitude;
            marker.latitude = position.latitude;

            loadMarker(marker);
          } else {
            marker.title = name;
            marker.description = description;
            marker.idTypeMarker = typeMarker;
            marker.dm = dm;
            marker.di = di;
            marker.da = da;
            marker.dv = dv;
            updateMarker();
          }
        } else {
          messageError = "Selecione uma Categoria";
        }
      } else {
        messageError = "Preencha a Descrição";
      }
    } else {
      messageError = "Preencha o Nome";
    }
  }

  loadMarker(MarkerModel marker) {
    loading = true;
    _markerRepositoryController.setMarker(marker);
    _markerRepositoryController.saveMarker().then((value) {
      loading = false;
      _googleMapController.markers.clear();
      _googleMapController.loadMarkers();
      Modular.to.pop();
    }).catchError((error) {
      print(error);
      loading = false;
      messageError =
          "Erro ao cadastrar marcador, verifique os campos e tente novamente!";
    });
  }

  updateMarker() {
    loading = true;
    print(marker.idMarker);
    _markerRepositoryController.updateMarker(marker).then((value) {
      loading = false;
      _googleMapController.markers.clear();
      _googleMapController.loadMarkers();
      Modular.to.pop();
    }).catchError((error) {
      PlatformException errorException = error;
      print(errorException.code);
      loading = false;
      messageError =
          "Erro ao atualizar o marcador, verifique os campos e tente novamente!";
    });
  }

  editMarker() async {
    if (marker != null) {
      TypeMarker typeMarker = await _typeMarkerRepositoryController
          .getTypeMarker(marker.idTypeMarker);

      name = marker.title;
      description = marker.description;
      dv = marker.dv;
      da = marker.da;
      di = marker.di;
      dm = marker.dm;

      position = Position(
        longitude: marker.longitude,
        latitude: marker.latitude,
      );

      dropdownMenuValue = DropdownMenuItem<TypeMarker>(
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
                typeMarker.name,
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

            TypeMarker typeMarker = TypeMarker(
              idTypeMarker: element.documentID,
              name: data["name"],
              icon: data["icon"],
            );
            dropdownMenuItems.add(
              DropdownMenuItem<TypeMarker>(
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
                        typeMarker.name,
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

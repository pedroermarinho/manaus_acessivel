import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manausacessivel/app/components/show_dialog_custom/show_dialog_custom_widget.dart';
import 'package:manausacessivel/app/models/marker_model.dart';
import 'package:manausacessivel/app/models/type_marker_model.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:mobx/mobx.dart';

import 'Dart:ui' as ui;

part 'google_map_custom_controller.g.dart';

class GoogleMapCustomController = _GoogleMapCustomControllerBase
    with _$GoogleMapCustomController;

abstract class _GoogleMapCustomControllerBase with Store {
  ///
  final _markerRepositoryController = Modular.get<MarkerRepositoryController>();

  ///
  final _typeMarkerRepositoryController =
      Modular.get<TypeMarkerRepositoryController>();

  ///
  @observable
  Completer<GoogleMapController> googleMapCompleter;

  ///
  @observable
  ObservableMap<String, Marker> markers = ObservableMap();

  ///
  @observable
  Position locationMarker = Position();

  ///
  @observable
  Position positionActual =
      Position(latitude: -3.0970296, longitude: -60.0285807);

  ///
  @action
  setPositionActual(Position value) {
    positionActual = value;
  }

  /// Latitude e Longitude Atual
  ///
  /// Provinda de um marcador ou um toque na no mapa
  @observable
  LatLng latLngActual;

  /// Inserir um nova Latitude e Longitude
  @action
  setLatLngActual(LatLng value) {
    latLngActual = value;
  }

  /// Latitude e Longitude do Marcador Atual
  ///
  /// Provinda de um marcador
  @observable
  Observable<LatLng> latLngMarkerActual;

  /// Inserir um nova Latitude e Longitude
  @action
  setLatLngMarkerActual(LatLng value) {
    latLngMarkerActual = Observable(value);
  }

  ///
  @observable
  BuildContext context;

  ///
  @observable
  CameraPosition cameraPosition;

  ///
  @action
  setCameraPosition(Position value) {
    cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude), zoom: 17);
  }

//  ///
//  @action
//  setMarkers(Marker value) => markers.addAll({value.markerId.value: value});

  /// Construdor
  _GoogleMapCustomControllerBase() {
    loadMarkers();
    recoverLastKnownLocation();
  }

  /// Mapa Criado
  @action
  onMapCreated(GoogleMapController googleMapController) {
    googleMapCompleter = Completer();
    googleMapCompleter.complete(googleMapController);
  }

  /// Carregar Macadores
  loadMarkers() async {
    _markerRepositoryController.getMarkers().listen((event) {
      event.documents.forEach((element) {
        Map<String, dynamic> data = element.data;
        if (element != null) {
          MarkerModel markerLocal = MarkerModel(
            idMarker: element.documentID,
            idUserCreator: data["idUserCreator"],
            idTypeMarker: data["idTypeMarker"],
            title: data["title"],
            description: data["description"],
            da: data["da"],
            di: data["di"],
            dm: data["dm"],
            dv: data["dv"],
            latitude: data["latitude"],
            longitude: data["longitude"],
          );
          viewMarker(markerLocal);
        }
      });
    });
  }

  /// Carregar Macadores por categoria
  loadMarkersCategories(String category) async {
    markers.clear();
    _markerRepositoryController.getMarkers().listen((event) {
      List<DocumentSnapshot> list = event.documents;

      List<DocumentSnapshot> listCategory = list.where((element) {
        switch (category) {
          case "da":
            return element.data["da"] == true;
            break;
          case "di":
            return element.data["di"] == true;
            break;
          case "dm":
            return element.data["dm"] == true;
            break;
          case "dv":
            return element.data["dv"] == true;
            break;
          case "all":
            return true;
            break;
          default:
            return false;
        }
      }).toList();

      listCategory.forEach((element) {
        Map<String, dynamic> data = element.data;
        if (element != null) {
          MarkerModel markerLocal = MarkerModel(
            idMarker: element.documentID,
            idUserCreator: data["idUserCreator"],
            idTypeMarker: data["idTypeMarker"],
            title: data["title"],
            description: data["description"],
            da: data["da"],
            di: data["di"],
            dm: data["dm"],
            dv: data["dv"],
            latitude: data["latitude"],
            longitude: data["longitude"],
          );
          viewMarker(markerLocal);
        }
      });
    });
  }

  /// Obter bytes do ativo
  ///
  /// recuperar icone para o mapa
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  /// Mostrar marcador
  @action
  viewMarker(MarkerModel marker) async {
    await _typeMarkerRepositoryController.getTypeMarker(marker.idTypeMarker);
    TypeMarker typeMarker = _typeMarkerRepositoryController.typeMarker;

    getBytesFromAsset('assets/icons/${typeMarker.icon}.png', 60).then((value) {
      BitmapDescriptor icon = BitmapDescriptor.fromBytes(value);

      Marker markerMap = Marker(
        markerId: MarkerId(marker.idMarker),
        position: LatLng(marker.latitude, marker.longitude),
        icon: icon,
        onTap: () {
          setLatLngActual(LatLng(marker.latitude, marker.longitude));
          setLatLngMarkerActual(LatLng(marker.latitude, marker.longitude));
        },
        infoWindow: InfoWindow(
            title: marker.title,
            onTap: () {
              setCameraPosition(Position(
                  latitude: marker.latitude, longitude: marker.longitude));
              _markerRepositoryController.setMarker(marker);
              Modular.to.pushNamed("/information").whenComplete(() {
                loadMarkers();
                showMarkerLocation(positionActual);
              });
            }),
      );
      markers.addAll({markerMap.markerId.value: markerMap});
    });
  }

  /// Mostrar Localização do Marcador
  @action
  showMarkerLocation(Position position) async {
    getBytesFromAsset('assets/icons/location-on.png', 70).then((value) {
      BitmapDescriptor icon = BitmapDescriptor.fromBytes(value);
      Marker markerMap = Marker(
        markerId: MarkerId("posicao"),
        infoWindow: InfoWindow(title: "Sua Localização"),
        position: LatLng(position.latitude, position.longitude),
        icon: icon,
        onTap: () {
          setLatLngActual(LatLng(position.latitude, position.longitude));
          setLatLngMarkerActual(LatLng(position.latitude, position.longitude));
        },
      );
      markers.addAll({markerMap.markerId.value: markerMap});
      setPositionActual(position);
    });
  }

  /// Obter Localização
  Future<Position> getLocation() async {
    if (positionActual == null) {
      return await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    } else {
      return positionActual;
    }
  }

  /// Recuperar Localização Atual
  recoverLocatingActual() async {
    Position position = await recoverPositionActual();
    recoverLocatingPosition(position);
  }

  /// Recuperar Posição da Localização
  recoverLocatingPosition(Position position) async {
    if (position != null) {
      setPositionActual(position);
      setCameraPosition(position);
      showMarkerLocation(position);
      setCameraPosition(position);
      moveCamera();
    }
  }

  /// Recuperar Posição da Localização Atual
  Future<Position> recoverPositionActual() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return position;
  }

  /// Recupera Ultima Localização Conhecida
  ///
  /// Localização salva pelo android
  /// Acesso mais rapido
  recoverLastKnownLocation() async {
    Position position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    setCameraPosition(position);
    autorun((Reaction value) {
      if (googleMapCompleter != null) {
        if (position != null) {
          recoverLocatingPosition(position);
        } else {
          recoverLocatingActual();
        }
        value.dispose();
      }
    });
  }

  /// Mover a Câmera
  moveCamera() async {
    GoogleMapController googleMapController = await googleMapCompleter.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        cameraPosition,
      ),
    );
  }

  /// Adicionar ouvinte de localização
  ///
  /// localização atual do usario em movimento
  addListenerLocation() {
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    geolocator.getPositionStream(locationOptions).listen(
      (Position position) {
        setPositionActual(position);
        setCameraPosition(position);
        moveCamera();
      },
    );
  }

  /// Opções Endereço
  Future<List<Placemark>> optionsAddress(String address) async {
    List<Placemark> listAdresses =
        await Geolocator().placemarkFromAddress(address + " Manaus");
    return listAdresses
        .where((element) => element.subAdministrativeArea == "Manaus")
        .toList();
  }

  /// Nova Localização
  newLocation(String address) async {
    if (address.isNotEmpty) {
      List<Placemark> listAdresses = await optionsAddress(address);

      if (listAdresses != null && listAdresses.isNotEmpty) {
        Placemark adresses = listAdresses[0];
        Position position = adresses.position;
        setPositionActual(position);
        setCameraPosition(position);
        moveCamera();
        showMarkerLocation(position);
      }
    } else {
      recoverLocatingActual();
    }
  }

  /// Informação do Endereço
  Future<Placemark> addressPossition(Position position) async {
    List<Placemark> listAdresses =
        await Geolocator().placemarkFromPosition(position);
    return listAdresses[0];
  }

  /// Novo marcador de local
  newLocationPlacemark(Placemark address) async {
    if (address != null) {
      Placemark endereco = address;
      Position position = endereco.position;
      setPositionActual(position);
      setCameraPosition(position);
      showMarkerLocation(position);
      moveCamera();
    }
  }

  newLocationPosition(Position position) async {
    if (position != null) {
      setCameraPosition(position);
      moveCamera();
    }
  }

  /// Criar novo marcador
  createNewMarker() async {
    Position position = await getLocation();
    Placemark endereco = await addressPossition(position);

    if (endereco != null) {
      String enderecoConfirmacao;
      enderecoConfirmacao = "\n Cidade: " + endereco.subAdministrativeArea;
      enderecoConfirmacao += "\n Rua: " + endereco.thoroughfare;
      enderecoConfirmacao += "\n Número: " + endereco.subThoroughfare;
      enderecoConfirmacao += "\n Bairro: " + endereco.subLocality;
      enderecoConfirmacao += "\n Cep: " + endereco.postalCode;

      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Confirmação do endereço"),
            content: Text(enderecoConfirmacao),
            contentPadding: EdgeInsets.all(16),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text(
                  "Confirmar",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushNamed("/marker");
                },
              ),
            ],
          );
        },
      );
    }
  }

  /// Bússola do mapa
  mapCompass() async {
    if (latLngActual != null) {
      GoogleMapController googleMapController = await googleMapCompleter.future;
      double zoom = await googleMapController.getZoomLevel();
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLngActual,
            bearing: 0,
            zoom: zoom,
          ),
        ),
      );
      setLatLngActual(null);
    } else {
      ShowDialogCustomWidget(
        context,
        title: "Ponto de Referência",
        labelText:
            "Clique no mapa para selecionar um ponto de Referência e tente novamente",
        icon: Icons.add_to_home_screen,
      );
    }
  }
}

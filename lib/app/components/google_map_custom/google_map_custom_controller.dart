import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  final _markerRepositoryController = Modular.get<MarkerRepositoryController>();
  final _typeMarkerRepositoryController =
      Modular.get<TypeMarkerRepositoryController>();

  @observable
  Completer<GoogleMapController> googleMapCompleter;

  @observable
  ObservableMap<String, Marker> markers = ObservableMap();

  @observable
  Position locationMarker = Position();

  @observable
  Position positionActual =
      Position(latitude: -3.0970296, longitude: -60.0285807);

  @action
  setPositionActual(Position value) {
    positionActual = value;
  }

  @observable
  BuildContext context;

  @observable
  CameraPosition cameraPosition;

  @action
  setCameraPosition(Position value) {
    cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude), zoom: 17);
  }

  @action
  setMarkers(Marker value) => markers.addAll({value.markerId.value: value});

  _GoogleMapCustomControllerBase() {
    loadMarkers();
    recoverLestLocatedKnowledge();
  }

  @action
  onMapCreated(GoogleMapController googleMapController) {
    googleMapCompleter = Completer();
    googleMapCompleter.complete(googleMapController);
  }

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

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

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
        infoWindow: InfoWindow(
            title: marker.title,
            onTap: () {
              setCameraPosition(Position(
                  latitude: marker.latitude, longitude: marker.longitude));
              _markerRepositoryController.setMarker(marker);
              Modular.to.pushNamed("/information").whenComplete(() {
                loadMarkers();
                showMarkLocation(positionActual);
              });
            }),
      );
      markers.addAll({markerMap.markerId.value: markerMap});
    });
  }

  @action
  showMarkLocation(Position position) async {
    getBytesFromAsset('assets/icons/location-on.png', 70).then((value) {
      BitmapDescriptor icon = BitmapDescriptor.fromBytes(value);
      Marker markerMap = Marker(
        markerId: MarkerId("posicao"),
        infoWindow: InfoWindow(title: "Sua Localização"),
        position: LatLng(position.latitude, position.longitude),
        icon: icon,
      );
      markers.addAll({markerMap.markerId.value: markerMap});
      setPositionActual(position);
    });
  }

  Future<Position> getLocation() async {
    if (positionActual == null) {
      return await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    } else {
      return positionActual;
    }
  }

  recoverLocatingActual() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    recoverLocatingPosition(position);
  }

  @action
  recoverLocatingPosition(Position position) async {
    if (position != null) {
      setPositionActual(position);
      setCameraPosition(position);
      showMarkLocation(position);
      setCameraPosition(position);
      moverCamera();
    }
  }

  Future<Position> recoverPositionActual() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return position;
  }

  recoverLestLocatedKnowledge() async {
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

  moverCamera() async {
    GoogleMapController googleMapController = await googleMapCompleter.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        cameraPosition,
      ),
    );
  }

  @action
  addListenerLocation() {
    //localização atual do usario em movimento

    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    geolocator.getPositionStream(locationOptions).listen(
      (Position position) {
        setPositionActual(position);
        setCameraPosition(position);
        moverCamera();
      },
    );
  }

  Future<List<Placemark>> optionsAddress(String address) async {
    return Geolocator().placemarkFromAddress(address);
  }

  @action
  newLocation(String address) async {
    if (address.isNotEmpty) {
      List<Placemark> listAdresses =
          await Geolocator().placemarkFromAddress(address);

      if (listAdresses != null && listAdresses.isNotEmpty) {
        Placemark adresses = listAdresses[0];
        Position position = adresses.position;
        setPositionActual(position);
        setCameraPosition(position);
        moverCamera();
        showMarkLocation(position);
      }
    } else {
      recoverLocatingActual();
    }
  }

  Future<Placemark> addressInformation(Position position) async {
    List<Placemark> listAdresses =
        await Geolocator().placemarkFromPosition(position);
    return listAdresses[0];
  }

  @action
  newLocationPlacemark(Placemark address) async {
    if (address != null) {
      Placemark endereco = address;
      Position position = endereco.position;
      setPositionActual(position);
      setCameraPosition(position);
      showMarkLocation(position);
      moverCamera();
    }
  }

  createNewMarker() async {
    Position position = await getLocation();
    List<Placemark> listaEnderecos =
        await Geolocator().placemarkFromPosition(position);

    if (listaEnderecos != null && listaEnderecos.isNotEmpty) {
      Placemark endereco = listaEnderecos[0];

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

  test() async {
//    GoogleMapController googleMapController = await googleMapCompleter.future;
//    googleMapController.animateCamera(
//      CameraUpdate.
//    );
  }
}

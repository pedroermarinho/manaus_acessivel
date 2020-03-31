import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manausacessivel/app/models/marker.dart';
import 'package:manausacessivel/app/models/type_marker.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:mobx/mobx.dart';
import 'Dart:ui' as ui;

part 'google_map_custom_controller.g.dart';

class GoogleMapCustomController = _GoogleMapCustomControllerBase
    with _$GoogleMapCustomController;

abstract class _GoogleMapCustomControllerBase with Store {
  final MarkerRepositoryController _markerRepositoryController =
      Modular.get<MarkerRepositoryController>();
  final TypeMarkerRepositoryController _typeMarkerRepositoryController =
      Modular.get<TypeMarkerRepositoryController>();

  @observable
  Completer<GoogleMapController> googleMapCompleter;

  @observable
  ObservableMap<String, Marker> markers = ObservableMap();

  @observable
  Position locationMarker = Position();

  @observable
  Position positionActual =Position(
    latitude:-3.0970296,
    longitude:  -60.0285807
  );

  @action
  setPositionActual(Position value){
    positionActual = value;
  }
  @observable
  BuildContext context;

  @observable
  CameraPosition cameraPosition;

  @action
  setCameraPosition(Position value){
    cameraPosition= CameraPosition(target: LatLng(value.latitude, value.longitude), zoom: 17);
  }


  @action
  setMarkers(Marker value) => markers.addAll({value.markerId.value: value});

  _GoogleMapCustomControllerBase() {
    loadMarkers();
    recuperarUltimaLocaizacaoConhecida();
  }

  @action
  onMapCreated(GoogleMapController googleMapController){
//    if(googleMapCompleter == null) {
      print("googleMapController");
      googleMapCompleter = Completer();
      googleMapCompleter.complete(googleMapController);
//    }
  }

  loadMarkers() async {
    _markerRepositoryController.getMarkers().listen((event) {
      event.documents.forEach((element) {
        Map<String, dynamic> data = element.data;
        if (element != null) {
          Marcador markerLocal = Marcador();
          markerLocal.idMarcador = element.documentID;
          markerLocal.idUserCreator = data["idTypeMarcador"];
          markerLocal.idTypeMarcador = data["idTypeMarcador"];
          markerLocal.title = data["title"];
          markerLocal.descricao = data["descricao"];
          markerLocal.dv = data["dv"];
          markerLocal.da = data["da"];
          markerLocal.di = data["di"];
          markerLocal.dm = data["dm"];
          markerLocal.latitude = data["latitude"];
          markerLocal.longitude = data["longitude"];
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
  viewMarker(Marcador marker) async {
    await _typeMarkerRepositoryController.getTypeMarker(marker.idTypeMarcador);

    TypeMarcador typeMarcador = _typeMarkerRepositoryController.typeMarker;

    getBytesFromAsset('assets/icons/${typeMarcador.icon}.png', 60)
        .then((value) {
      BitmapDescriptor icon = BitmapDescriptor.fromBytes(value);

      Marker marcadorMap = Marker(
        markerId: MarkerId(marker.idMarcador),
        position: LatLng(marker.latitude, marker.longitude),
        icon: icon,
        infoWindow: InfoWindow(
            title: marker.title,
            onTap: () {
              setCameraPosition(Position(latitude: marker.latitude,longitude:marker.longitude));
              _markerRepositoryController.setMarker(marker);
              Modular.to.pushNamed("/information").whenComplete(() {
                loadMarkers();
                exibirMarcadorLocalizacao(positionActual);
              });
            }),
      );
      markers.addAll({marcadorMap.markerId.value: marcadorMap});
    });
  }

  @action
  exibirMarcadorLocalizacao(Position position) async {
    getBytesFromAsset('assets/icons/location-on.png', 70).then((value) {
      BitmapDescriptor icon = BitmapDescriptor.fromBytes(value);
      Marker marcadorMap = Marker(
        markerId: MarkerId("posicao"),
        infoWindow: InfoWindow(title: "Sua Localização"),
        position: LatLng(position.latitude, position.longitude),
        icon: icon,
      );
      markers.addAll({marcadorMap.markerId.value: marcadorMap});
      setPositionActual(position);
    });
  }

  Future<Position> getLocaizacao() async {
    if (positionActual == null) {
      return await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    } else {
      return positionActual;
    }
  }

  recuperarLocaizacaoAtual() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    recuperarLocaizacaoPosition(position);
  }

  @action
  recuperarLocaizacaoPosition(Position position) async {
    if (position != null) {
      setPositionActual(position);
      setCameraPosition(position);
      exibirMarcadorLocalizacao(position);
      setCameraPosition(position);
      movimentarCamera();
    }
  }

  Future<Position> recuperarPositionAtual() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return position;
  }

  recuperarUltimaLocaizacaoConhecida() async {
    Position position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
      setCameraPosition(position);
      autorun((Reaction value){
      if(googleMapCompleter!=null) {
        if (position != null) {
          recuperarLocaizacaoPosition(position);
        } else {
          recuperarLocaizacaoAtual();
        }
        value.dispose();
      }
    });

  }

  movimentarCamera() async {
    GoogleMapController googleMapController = await googleMapCompleter.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        cameraPosition,
      ),
    );
  }

  @action
  adiconarListenerLocalizacao() {
    //localização atual do usario em movimento

    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    geolocator.getPositionStream(locationOptions).listen(
      (Position position) {
        setPositionActual(position);
        setCameraPosition(position);
        movimentarCamera();
      },
    );
  }

  Future<List<Placemark>> optionsAddress(String address) async {
    return Geolocator().placemarkFromAddress(address);
  }

  @action
  novaLocalizacao(String address) async {
    if (address.isNotEmpty) {
      List<Placemark> listaEnderecos =
          await Geolocator().placemarkFromAddress(address);

      if (listaEnderecos != null && listaEnderecos.length > 0) {
        Placemark endereco = listaEnderecos[0];
        Position position = endereco.position;
        setPositionActual(position);
        setCameraPosition(position);
        movimentarCamera();
        exibirMarcadorLocalizacao(position);
      }
    } else {
      recuperarLocaizacaoAtual();
    }
  }
  Future<Placemark> addressInformation(Position position)async{
    List<Placemark> listaEnderecos = await Geolocator().placemarkFromPosition(position);
    return listaEnderecos[0];
  }

  @action
  novaLocalizacaoPlacemark(Placemark address) async {
    if (address != null) {
      Placemark endereco = address;
      Position position = endereco.position;
      setPositionActual(position);
      setCameraPosition(position);
      exibirMarcadorLocalizacao(position);
      movimentarCamera();
    }
  }

  createNewMarker() async {
    Position position = await getLocaizacao();
    List<Placemark> listaEnderecos =
        await Geolocator().placemarkFromPosition(position);

    if (listaEnderecos != null && listaEnderecos.length > 0) {
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
}



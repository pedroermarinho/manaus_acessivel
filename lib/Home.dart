
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manausacessivel/controller/carregarDados.dart';
import 'package:manausacessivel/infor.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _marcadores = new Set();
  CameraPosition _cameraPosition =CameraPosition(
    target: LatLng(-3.0970296, -60.0285807),
    zoom: 15
    );

  _onMapCreated(GoogleMapController googleMapController){
    _controller.complete(googleMapController);
  }

  _carregarMarcadores() async{
    Set<Marker> marcadoresLocal=new Set<Marker>();
    for(var data in await carregarDadosMarcadores()){
      Marker marcadorCasa = Marker(
        markerId: MarkerId(data["id"]),
        position: LatLng(data["latitude"],data["longitude"]),
        infoWindow: InfoWindow(
          title: data["title"]
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure
        ),
        onTap: (){
          Navigator.push(context,
           MaterialPageRoute(
             builder: (context) => Infor(data)
             )
           );
        }
        );
      marcadoresLocal.add(marcadorCasa);
    }
    setState(() {
      _marcadores =marcadoresLocal;
    });
  }

  _recuperarLocaizacaoAtual() async {
    Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium
    );
    setState(() {
       _cameraPosition =CameraPosition(
         target: LatLng(position.latitude, position.longitude),
         zoom: 17
       );
       _movimentarCamera();
    });
  }

  _movimentarCamera() async{
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        _cameraPosition,
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _carregarMarcadores();
    _recuperarLocaizacaoAtual();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manaus Acessível"),
      ),
      body: Container(
        child: GoogleMap(
            mapType: MapType.normal,
            //-3.0970296,-60.0285807,
            initialCameraPosition: _cameraPosition,
          onMapCreated: _onMapCreated,
          markers: _marcadores,
          myLocationEnabled: true,
        ),
      ),
    );
  }
}

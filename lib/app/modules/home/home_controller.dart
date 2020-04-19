import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/components/show_dialog_custom/show_dialog_custom_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _googleMapCustomController = Modular.get<GoogleMapCustomController>();

  @observable
  BuildContext context;

  @observable
  String address;

  @observable
  ObservableList<Widget> listWidgetOptionsAddress = ObservableList();

  compassMap() async {
    await _googleMapCustomController.mapCompass();
  }

  newLocation(String address) async {
    await _googleMapCustomController.newLocation(address);
  }

  createNewMarker() async {
    await _googleMapCustomController.createNewMarker();
  }

  recoverLocatingActual() async {
    await _googleMapCustomController.recoverLocatingActual();
  }

  newLocationPlacemark(Placemark address) async {
    await _googleMapCustomController.newLocationPlacemark(address);
  }

  isValidAddress(String address) {
    this.address = address;
    if (address.isEmpty) {
      recoverLocatingActual();
    } else {
      optionsAddress(address);
    }
  }

  @action
  optionsAddress(String address) async {
    if (address.isNotEmpty) {
      _googleMapCustomController
          .optionsAddress(address)
          .then((listaEnderecos) {
            if (listaEnderecos != null && listaEnderecos.isNotEmpty) {
              listWidgetOptionsAddress.clear();
              listWidgetOptionsAddress.add(
                GestureDetector(
                  onTap: () {
                    listWidgetOptionsAddress.clear();
                    newLocationPlacemark(listaEnderecos[0]);
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        listaEnderecos[0].thoroughfare +
                            "," +
                            listaEnderecos[0].subThoroughfare,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        "- " +
                            listaEnderecos[0].subLocality +
                            "," +
                            listaEnderecos[0].subAdministrativeArea,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              );
            }
          })
          .catchError((_) {})
          .whenComplete(() {
            if (this.address == null || this.address.isEmpty) {
              listWidgetOptionsAddress.clear();
            }
          });

      return null;
    }
  }

  openMap() async {
    if (_googleMapCustomController.latLngMarkerActual != null &&
        _googleMapCustomController.latLngMarkerActual.value != null) {
      String url =
          "https://www.google.com/maps/search/?api=1&query=${_googleMapCustomController.latLngMarkerActual.value.latitude},${_googleMapCustomController.latLngMarkerActual.value.longitude}";
      if (await canLaunch(url)) {
        await launch(url);
        _googleMapCustomController.setLatLngMarkerActual(null);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      ShowDialogCustomWidget(context,
          title: "Marcador",
          labelText: "Selecione um Marcador",
          icon: Icons.not_listed_location);
    }
  }
}

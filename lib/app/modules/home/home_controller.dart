import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthController _authController = Modular.get<AuthController>();
  final GoogleMapCustomController _googleMapCustomController =
      Modular.get<GoogleMapCustomController>();
  @observable
  List<String> itensMenu = ["Deslogar", "Configurações","Sobre"];

  @observable
  BuildContext context;

  @observable
  String address;

  @observable
  ObservableList<Widget> listWidgetOptionsAddress = ObservableList();

  logoutUser() async {
    await _authController.logout();
    pushSplashScreen();
  }

  pushSplashScreen() {
    Modular.to.pushReplacementNamed(Modular.initialRoute);
  }

  pushSettings() {
    Modular.to.pushNamed("/settings");
  }
  pushAbout() {
    Modular.to.pushNamed("/about");
  }

  selectMenuItem(String escolha) {
    switch (escolha) {
      case "Configurações":
        pushSettings();
        break;
      case "Deslogar":
        logoutUser();
        break;
      case "Sobre":
        pushAbout();
        break;
    }
  }

  novaLocalizacao(String address) {
    _googleMapCustomController.novaLocalizacao(address);
  }

  createNewMarker() {
    _googleMapCustomController.createNewMarker();
  }

  recuperarLocaizacaoAtual() {
    _googleMapCustomController.recuperarLocaizacaoAtual();
  }

  novaLocalizacaoPlacemark(Placemark address) {
    _googleMapCustomController.novaLocalizacaoPlacemark(address);
  }

  isValidAddress(String address) {
    this.address = address;
    if (address.isEmpty) {
      recuperarLocaizacaoAtual();
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
            if (listaEnderecos != null && listaEnderecos.length > 0) {
              listWidgetOptionsAddress.clear();
              listWidgetOptionsAddress.add(
                GestureDetector(
                  onTap: () {
                    listWidgetOptionsAddress.clear();
                    novaLocalizacaoPlacemark(listaEnderecos[0]);
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
}

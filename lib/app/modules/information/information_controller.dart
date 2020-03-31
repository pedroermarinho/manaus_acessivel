import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/models/marker.dart';
import 'package:manausacessivel/app/models/user.dart';
import 'package:manausacessivel/app/modules/information/components/marker_icon_detector/marker_icon_detector_widget.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/shared/utils/type_user.dart';
import 'package:mobx/mobx.dart';

part 'information_controller.g.dart';

class InformationController = _InformationControllerBase
    with _$InformationController;

abstract class _InformationControllerBase with Store {
  //use 'controller' variable to access controller
  final MarkerRepositoryController _markerRepositoryController =
      Modular.get<MarkerRepositoryController>();
  final UserRepositoryController _userRepositoryController =
      Modular.get<UserRepositoryController>();
  final GoogleMapCustomController _googleMapCustomController =
      Modular.get<GoogleMapCustomController>();

  @observable
  Marcador marcador;

  @observable
  List<String> itensMenu = [];

  @observable
  ObservableList<Widget> iconsAssList = ObservableList();

  @observable
  bool loading = false;

  @observable
  Placemark placemark;

  _InformationControllerBase() {
    recuperarMarcador();
    typeUser();
  }

  recuperarMarcador() async {
    this.marcador = _markerRepositoryController.marker;
    iconsAss();
    placemark = await _googleMapCustomController.addressInformation(
      Position(
        latitude: marcador.latitude,
        longitude: marcador.longitude,
      ),
    );
    loading = false;
  }

  iconsAss() {
    if (marcador.dm) {
      iconsAssList.add(MarkerIconDetectorWidget(
        icon: FontAwesomeIcons.accessibleIcon,
        labelText: "Deficiência Motora",
      ));
    }
    if (marcador.dv) {
      iconsAssList.add(
        MarkerIconDetectorWidget(
          icon: FontAwesomeIcons.blind,
          labelText: "Deficiência Visual",
        ),
      );
    }
    if (marcador.da) {
      iconsAssList.add(
        MarkerIconDetectorWidget(
          icon: FontAwesomeIcons.signLanguage,
          labelText: "Deficiência Auditiva",
        ),
      );
    }
    if (marcador.di) {
      iconsAssList.add(MarkerIconDetectorWidget(
        icon: FontAwesomeIcons.brain,
        labelText: "Deficiência Intelectual",
      ));
    }
  }

  typeUser() async {
    Usuario usuario = await _userRepositoryController.getUser();
    if (usuario.userType == TypeUser.usuarioAdministradores ||
        usuario.idUsuario == marcador.idUserCreator) {
      itensMenu.add("Editar");
      itensMenu.add("Deletar");
    }
  }

  escolhaMenuItem(String escolha) {
    switch (escolha) {
      case "Editar":
        print("Editar");

        Modular.to.pushNamed("/marker", arguments: marcador).whenComplete(() {
          loading = true;
          iconsAssList.clear();
          recuperarMarcador();
        });
        break;
      case "Deletar":
        _markerRepositoryController.setMarker(marcador);
        _markerRepositoryController.deleteMarker();
        _googleMapCustomController.markers.clear();
        _googleMapCustomController.loadMarkers();
        Modular.to.pop();
        break;
    }
  }
}

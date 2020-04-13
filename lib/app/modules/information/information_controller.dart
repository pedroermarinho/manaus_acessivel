import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/models/favorite_model.dart';
import 'package:manausacessivel/app/models/marker_model.dart';
import 'package:manausacessivel/app/models/user_model.dart';
import 'package:manausacessivel/app/modules/information/components/marker_icon_detector/marker_icon_detector_widget.dart';
import 'package:manausacessivel/app/modules/information/repositories/stars/stars_repository_controller.dart';
import 'package:manausacessivel/app/repositories/favorite/favorite_repository_controller.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';
import 'package:manausacessivel/app/shared/utils/type_user.dart';
import 'package:mobx/mobx.dart';

import 'models/stars_model.dart';

part 'information_controller.g.dart';

class InformationController = _InformationControllerBase
    with _$InformationController;

abstract class _InformationControllerBase with Store {
  //use 'controller' variable to access controller
  final _markerRepositoryController = Modular.get<MarkerRepositoryController>();
  final _userRepositoryController = Modular.get<UserRepositoryController>();
  final _googleMapCustomController = Modular.get<GoogleMapCustomController>();
  final _favoriteRepositoryController =
      Modular.get<FavoriteRepositoryController>();

//  final _commentRepositoryController =Modular.get<CommentRepositoryController>();

  final _starsRepositoryController = Modular.get<StarsRepositoryController>();
  final _authRepositoryController = Modular.get<AuthRepositoryController>();

  @observable
  User userMarker;

  @observable
  MarkerModel marker;

  @observable
  List<String> itemsMenu = [];

  @observable
  FavoriteModel favorite;

  setFavorite(FavoriteModel value) => favorite = value;

  @observable
  ObservableList<Widget> iconsAssList = ObservableList();

  @observable
  bool loading = false;

  @observable
  Placemark placemark;

  _InformationControllerBase() {
    recoverMarker();
    getUserMarker();
    typeUser();
    getFavorite();
    getStars();
    mediaStars();
  }

  @action
  getUserMarker() async {
    this.userMarker =
        await _userRepositoryController.getUserId(marker.idUserCreator);
  }

  ///
  recoverMarker() async {
    this.marker = _markerRepositoryController.marker;
    iconsAss();
    placemark = await _googleMapCustomController.addressPossition(
      Position(
        latitude: marker.latitude,
        longitude: marker.longitude,
      ),
    );
    loading = false;
  }

  ///
  iconsAss() {
    if (marker.dm) {
      iconsAssList.add(MarkerIconDetectorWidget(
        icon: FontAwesomeIcons.accessibleIcon,
        labelText: "Deficiência Motora",
      ));
    }
    if (marker.dv) {
      iconsAssList.add(
        MarkerIconDetectorWidget(
          icon: FontAwesomeIcons.blind,
          labelText: "Deficiência Visual",
        ),
      );
    }
    if (marker.da) {
      iconsAssList.add(
        MarkerIconDetectorWidget(
          icon: FontAwesomeIcons.signLanguage,
          labelText: "Deficiência Auditiva",
        ),
      );
    }

    ///
    if (marker.di) {
      iconsAssList.add(MarkerIconDetectorWidget(
        icon: FontAwesomeIcons.brain,
        labelText: "Deficiência Intelectual",
      ));
    }
  }

  ///
  typeUser() async {
    User user = await _userRepositoryController.getUser();
    if (user.userType == TypeUser.userAdministrators ||
        user.idUser == marker.idUserCreator) {
      itemsMenu.add("Editar");
      itemsMenu.add("Deletar");
    } else {}
  }

  ///
  selectionMenuItem(String selection) {
    switch (selection) {
      case "Editar":
        Modular.to.pushNamed("/marker", arguments: marker).whenComplete(() {
          loading = true;
          iconsAssList.clear();
          recoverMarker();
        });
        break;
      case "Deletar":
        _markerRepositoryController.setMarker(marker);
        _markerRepositoryController.deleteMarker();
        _googleMapCustomController.markers.clear();
        _googleMapCustomController.loadMarkers();
        Modular.to.pop();
        break;
    }
  }

  /// Deleta um favorito
  Future deleteFavoriteMarker() {
    return _favoriteRepositoryController
        .deleteFavoriteMarker(marker.idMarker)
        .whenComplete(() {
      setFavorite(null);
    });
  }

  /// Salva um novo favorito
  Future saveFavoriteMarker() {
    return _favoriteRepositoryController
        .saveFavoriteMarker(marker.idMarker)
        .whenComplete(getFavorite);
  }

  getFavorite() async {
    _favoriteRepositoryController
        .getFavoriteMarker(marker.idMarker)
        .then(setFavorite);
  }

  @observable
  StarsModel stars;

  @action
  setStars(StarsModel value) => stars = value;

  getStars() async {
    _starsRepositoryController.getStarsUser(marker.idMarker).then(setStars).whenComplete(loadStars);
  }

  @action
  salveStars(int value) {
    if (stars == null) {
      stars = StarsModel(
          idMarker: marker.idMarker,
          idUser: _authRepositoryController.userAuth.uid,
          stars: value);
      _starsRepositoryController.saveStars(stars).whenComplete(loadStars);
    } else {
      stars.stars = value;
      _starsRepositoryController.updateStars(stars).whenComplete(loadStars);
    }
  }

  bool isValidStars(int value) {
    if (stars != null && stars.stars != null) {
      return stars.stars >= value;
    } else {
      return false;
    }
  }

  @observable
  bool star1=false;

  @observable
  bool star2=false;

  @observable
  bool star3=false;

  @observable
  bool star4=false;

  @observable
  bool star5=false;

  @action
  loadStars() {
    star1 = isValidStars(1);
    star2 = isValidStars(2);
    star3 = isValidStars(3);
    star4 = isValidStars(4);
    star5 = isValidStars(5);
  }

  @observable
  double media = 0;

  mediaStars(){
    _starsRepositoryController.getStars(marker.idMarker).listen((event) {
      media = 0;
      List<DocumentSnapshot> list = event.documents;
      int listlength =list.length;
      list.forEach((element) {
        media +=element.data["stars"]/listlength;
      });
    });
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/marker_model.dart';
import 'package:manausacessivel/app/modules/information/information_controller.dart';
import 'package:manausacessivel/app/modules/information/models/stars_model.dart';
import 'package:manausacessivel/app/modules/information/repositories/stars/stars_repository_controller.dart';
import 'package:mobx/mobx.dart';

part 'stars_icon_controller.g.dart';

class StarsIconController = _StarsIconControllerBase with _$StarsIconController;

abstract class _StarsIconControllerBase with Store {
  final _starsRepositoryController = Modular.get<StarsRepositoryController>();
  final _informationController = Modular.get<InformationController>();

  @observable
  StarsModel stars;

  MarkerModel _marker;

  setStars(StarsModel value) => stars =value;

  _StarsIconControllerBase(){
    getMarker();
    getStars();
    print(stars);
  }

  getMarker(){
    _marker = _informationController.marker;
  }

  getStars()async{
    await _starsRepositoryController.getStars(_marker.idMarker).then(setStars);
  }

  bool isValidStar1(){
    return false;
  }

}

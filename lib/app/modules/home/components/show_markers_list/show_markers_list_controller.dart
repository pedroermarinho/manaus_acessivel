import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:mobx/mobx.dart';

part 'show_markers_list_controller.g.dart';

class ShowMarkersListController = _ShowMarkersListControllerBase
    with _$ShowMarkersListController;

abstract class _ShowMarkersListControllerBase with Store {
  final _googleMapCustomController = Modular.get<GoogleMapCustomController>();

  getDA() {
    _googleMapCustomController.loadMarkersCategories("da");
  }

  getDI() {
    _googleMapCustomController.loadMarkersCategories("di");
  }

  getDM() {
    _googleMapCustomController.loadMarkersCategories("dm");
  }

  getDV() {
    _googleMapCustomController.loadMarkersCategories("dv");
  }

  getALL() {
    _googleMapCustomController.loadMarkersCategories("all");
  }
}

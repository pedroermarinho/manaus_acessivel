import 'package:mobx/mobx.dart';

part 'marker_icon_detector_controller.g.dart';

class MarkerIconDetectorController = _MarkerIconDetectorControllerBase
    with _$MarkerIconDetectorController;

abstract class _MarkerIconDetectorControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

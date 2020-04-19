import 'package:mobx/mobx.dart';

part 'show_dialog_custom_controller.g.dart';

class ShowDialogCustomController = _ShowDialogCustomControllerBase
    with _$ShowDialogCustomController;

abstract class _ShowDialogCustomControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

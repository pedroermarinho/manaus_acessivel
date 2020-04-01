import 'package:mobx/mobx.dart';

part 'menu_item_controller.g.dart';

class MenuItemController = _MenuItemControllerBase with _$MenuItemController;

abstract class _MenuItemControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

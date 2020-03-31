import 'package:manausacessivel/app/modules/settings/settings_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/settings/settings_page.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SettingsController()),
        Bind((i) => UserRepositoryController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SettingsPage()),
      ];

  static Inject get to => Inject<SettingsModule>.of();
}

import 'package:manausacessivel/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/login/login_page.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => AuthRepositoryController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}

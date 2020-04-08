import 'package:manausacessivel/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/splash_screen/splash_screen_page.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashScreenController()),
        Bind((i) => AuthRepositoryController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}

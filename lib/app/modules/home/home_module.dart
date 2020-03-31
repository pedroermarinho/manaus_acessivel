import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/home/home_page.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

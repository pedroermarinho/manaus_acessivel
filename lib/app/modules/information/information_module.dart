import 'package:manausacessivel/app/modules/information/components/marker_icon_detector/marker_icon_detector_controller.dart';
import 'package:manausacessivel/app/modules/information/information_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/information_page.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';

class InformationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MarkerIconDetectorController()),
        Bind((i) => InformationController()),
        Bind((i) => UserRepositoryController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => InformationPage()),
      ];

  static Inject get to => Inject<InformationModule>.of();
}

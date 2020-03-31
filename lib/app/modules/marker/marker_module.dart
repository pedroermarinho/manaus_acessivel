import 'package:manausacessivel/app/modules/marker/marker_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/marker/marker_page.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';

class MarkerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MarkerController()),
        Bind((i) => MarkerRepositoryController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => MarkerPage(
                  marker: args.data,
                )),
      ];

  static Inject get to => Inject<MarkerModule>.of();
}

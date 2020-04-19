import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/home/components/show_favorite_list/show_favorite_list_controller.dart';
import 'package:manausacessivel/app/modules/home/components/show_markers_list/show_markers_list_controller.dart';
import 'package:manausacessivel/app/modules/home/home_controller.dart';
import 'package:manausacessivel/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ShowFavoriteListController()),
        Bind((i) => ShowMarkersListController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

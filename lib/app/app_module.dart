import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/app_controller.dart';
import 'package:manausacessivel/app/app_widget.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/components/show_dialog_custom/show_dialog_custom_controller.dart';
import 'package:manausacessivel/app/components/sidebar/sidebar_controller.dart';
import 'package:manausacessivel/app/components/text_field_custom/text_field_custom_controller.dart';
import 'package:manausacessivel/app/modules/home/components/show_markers_list/show_markers_list_controller.dart';
import 'package:manausacessivel/app/modules/home/home_module.dart';
import 'package:manausacessivel/app/modules/information/information_module.dart';
import 'package:manausacessivel/app/modules/login/login_module.dart';
import 'package:manausacessivel/app/modules/marker/marker_controller.dart';
import 'package:manausacessivel/app/modules/marker/marker_module.dart';
import 'package:manausacessivel/app/modules/profile/profile_module.dart';
import 'package:manausacessivel/app/modules/register/register_module.dart';
import 'package:manausacessivel/app/modules/settings/settings_module.dart';
import 'package:manausacessivel/app/modules/splash_screen/splash_screen_module.dart';
import 'package:manausacessivel/app/pages/about/about_controller.dart';
import 'package:manausacessivel/app/pages/about/about_page.dart';
import 'package:manausacessivel/app/repositories/favorite/favorite_repository_controller.dart';
import 'package:manausacessivel/app/repositories/favorite/repository/favorite_repository.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/marker/repository/marker_repository.dart';
import 'package:manausacessivel/app/repositories/type_marker/repository/type_marker_repository.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/user/repository/user_repository.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/repository/auth_repository.dart';
import 'package:manausacessivel/app/shared/config/config_repository_controller.dart';
import 'package:manausacessivel/app/shared/config/repository/config_repository.dart';
import 'package:manausacessivel/app/shared/mysql/mysql_repository_controller.dart';
import 'package:manausacessivel/app/shared/mysql/repository/mysql_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfigRepositoryController(), lazy: false),
        Bind((i) => ConfigRepository()),
        Bind((i) => MysqlRepositoryController()),
        Bind((i) => MysqlRepository()),
        Bind((i) => FavoriteRepositoryController()),
        Bind((i) => FavoriteRepository()),
        Bind((i) => ShowMarkersListController()),
        Bind((i) => ShowDialogCustomController()),
        Bind((i) => SidebarController()),
        Bind((i) => TypeMarkerRepositoryController()),
        Bind((i) => MarkerRepositoryController()),
        Bind((i) => UserRepositoryController()),
        Bind((i) => GoogleMapCustomController()),
        Bind((i) => TextFieldCustomController()),
        Bind((i) => UserRepository()),
        Bind((i) => TypeMarkerRepository()),
        Bind((i) => MarkerRepository()),
        Bind((i) => MarkerController()),
        Bind((i) => AboutController()),
        Bind((i) => AuthRepository()),
        Bind((i) => AuthRepositoryController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          module: SplashScreenModule(),
          transition: TransitionType.scale,
        ),
//        Router(Modular.initialRoute, module: ProfileModule()),
        Router(
          "/home",
          module: HomeModule(),
          transition: TransitionType.noTransition,
        ),
        Router(
          "/login",
          module: LoginModule(),
          transition: TransitionType.noTransition,
        ),
        Router(
          "/information",
          module: InformationModule(),
          transition: TransitionType.downToUp,
        ),
        Router(
          "/marker",
          module: MarkerModule(),
          transition: TransitionType.downToUp,
        ),
        Router("/register", module: RegisterModule()),
        Router(
          "/settings",
          module: SettingsModule(),
          transition: TransitionType.leftToRight,
        ),
        Router(
          "/profile",
          module: ProfileModule(),
          transition: TransitionType.leftToRight,
        ),
        Router(
          "/about",
          child: (_, args) => AboutPage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

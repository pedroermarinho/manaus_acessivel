import 'package:manausacessivel/app/components/sidebar/sidebar_controller.dart';
import 'package:manausacessivel/app/modules/marker/marker_controller.dart';
import 'package:manausacessivel/app/pages/about/about_page.dart';
import 'package:manausacessivel/app/repositories/type_marker/type_marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/marker/marker_repository_controller.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/components/google_map_custom/google_map_custom_controller.dart';
import 'package:manausacessivel/app/components/text_field_custom/text_field_custom_controller.dart';
import 'package:manausacessivel/app/modules/information/information_module.dart';
import 'package:manausacessivel/app/modules/marker/marker_module.dart';
import 'package:manausacessivel/app/modules/register/register_module.dart';
import 'package:manausacessivel/app/modules/settings/settings_module.dart';
import 'package:manausacessivel/app/modules/splash_screen/splash_screen_module.dart';
import 'package:manausacessivel/app/repositories/user/repository/user_repository.dart';
import 'package:manausacessivel/app/repositories/type_marker/repository/type_marker_repository.dart';
import 'package:manausacessivel/app/repositories/marker/repository/marker_repository.dart';
import 'package:manausacessivel/app/pages/about/about_controller.dart';
import 'package:manausacessivel/app/modules/login/login_module.dart';
import 'package:manausacessivel/app/shared/auth/repository/auth_repository.dart';
import 'package:manausacessivel/app/shared/auth/auth_controller.dart';
import 'package:manausacessivel/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:manausacessivel/app/app_widget.dart';
import 'package:manausacessivel/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SidebarController()),
        Bind<TypeMarkerRepositoryController>(
            (i) => TypeMarkerRepositoryController()),
        Bind<MarkerRepositoryController>((i) => MarkerRepositoryController()),
        Bind<UserRepositoryController>((i) => UserRepositoryController()),
        Bind<GoogleMapCustomController>((i) => GoogleMapCustomController()),
        Bind<TextFieldCustomController>((i) => TextFieldCustomController()),
        Bind<UserRepository>((i) => UserRepository()),
        Bind<TypeMarkerRepository>((i) => TypeMarkerRepository()),
        Bind<MarkerRepository>((i) => MarkerRepository()),
        Bind<MarkerController>((i) => MarkerController()),
        Bind<AboutController>((i) => AboutController()),
        Bind<AuthRepository>((i) => AuthRepository()),
        Bind<AuthController>((i) => AuthController()),
        Bind<AppController>((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: SplashScreenModule()),
//        Router(Modular.initialRoute, module: MenuModule()),
        Router("/home", module: HomeModule()),
        Router("/login", module: LoginModule()),
        Router("/information", module: InformationModule()),
        Router("/marker", module: MarkerModule()),
        Router("/register", module: RegisterModule()),
        Router("/settings", module: SettingsModule()),
        Router("/about", child: (_, args) => AboutPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:manausacessivel/app/shared/config/config_repository_controller.dart';
import 'package:manausacessivel/app/app_module.dart';

void main() {
  initModule(AppModule());
   ConfigRepositoryController config;
  //
  setUp(() {
         config = AppModule.to.get<ConfigRepositoryController>();
  });



  group('ConfigController Test', () {
       test("First Test", () {
         expect(config, isInstanceOf<ConfigRepositoryController>());
       });

       test("Set Value", () {
         prints(config.getMysql());
       });
  });
}

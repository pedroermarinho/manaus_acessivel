import 'package:manausacessivel/app/modules/information/components/comments/comments_controller.dart';
import 'package:manausacessivel/app/modules/information/components/stars_icon/stars_icon_controller.dart';
import 'package:manausacessivel/app/modules/information/components/marker_icon_detector/marker_icon_detector_controller.dart';
import 'package:manausacessivel/app/modules/information/information_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/information_page.dart';
import 'package:manausacessivel/app/modules/information/repositories/comment/comment_repository_controller.dart';
import 'package:manausacessivel/app/modules/information/repositories/comment/repository/comment_repository.dart';
import 'package:manausacessivel/app/modules/information/repositories/stars/repository/stars_repository.dart';
import 'package:manausacessivel/app/modules/information/repositories/stars/stars_repository_controller.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/shared/mysql/mysql_repository_controller.dart';
import 'package:manausacessivel/app/shared/mysql/repository/mysql_repository.dart';

class InformationModule extends ChildModule {
  @override
  List<Bind> get binds => [
//        Bind((i) => MysqlRepositoryController(),lazy: false),
        Bind((i) => MysqlRepository(),lazy: false),
        Bind((i) => CommentsController()),
        Bind((i) => StarsIconController()),
        Bind((i) => MarkerIconDetectorController()),
        Bind((i) => InformationController()),
        Bind((i) => UserRepositoryController()),
        Bind((i) => CommentRepositoryController()),
        Bind((i) => CommentRepository()),
        Bind((i) => StarsRepositoryController()),
        Bind((i) => StarsRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => InformationPage()),
      ];


  static Inject get to => Inject<InformationModule>.of();
}

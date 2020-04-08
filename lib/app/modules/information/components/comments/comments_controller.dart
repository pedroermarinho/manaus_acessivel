import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/repositories/comment/comment_repository_controller.dart';
import 'package:mobx/mobx.dart';

part 'comments_controller.g.dart';

class CommentsController = _CommentsControllerBase with _$CommentsController;

abstract class _CommentsControllerBase with Store {
  final _commentRepositoryController = Modular.get<CommentRepositoryController>();
}

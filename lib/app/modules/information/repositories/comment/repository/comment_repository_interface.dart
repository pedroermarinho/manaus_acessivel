import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';
import 'package:mysql1/mysql1.dart';

abstract class ICommentRepository extends Disposable {
  Future<Results> getComments(String idMarker);

  Future<Results> saveComment(CommentModel comment);

  Future<Results> deleteComment(CommentModel comment);

  Future<Results> deleteAllComment(String idMarker);
}

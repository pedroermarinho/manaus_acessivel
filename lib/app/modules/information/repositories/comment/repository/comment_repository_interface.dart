import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';

abstract class ICommentRepository {
  Stream<QuerySnapshot> getComments(String idMarker);

  Future saveComment(CommentModel comment);

  Future deleteComment(String idComment);

  deleteAllComment(String idMarker);
}

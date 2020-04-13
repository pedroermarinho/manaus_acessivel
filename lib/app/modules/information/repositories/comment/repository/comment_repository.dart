import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';

import 'comment_repository_interface.dart';

class CommentRepository implements ICommentRepository {
  final Firestore _firestore = Firestore.instance;
  final String _collectionDB = "comments";

  @override
  deleteAllComment(String idMarker) {
    _firestore
        .collection(_collectionDB)
        .where("idMarker", isEqualTo: idMarker)
        .snapshots()
        .listen((event) {
      event.documents.forEach((element) {
        deleteComment(element.data["idStars"]);
      });
    });
  }

  @override
  Stream<QuerySnapshot> getComments(String idMarker) {
    return _firestore
        .collection(_collectionDB)
        .where("idMarker", isEqualTo: idMarker)
        .snapshots();
  }

  @override
  Future saveComment(CommentModel comment) {
    return _firestore
        .collection(_collectionDB)
        .document()
        .setData(comment.toMap());
  }

  @override
  Future deleteComment(String idComment) {
    return _firestore.collection(_collectionDB).document(idComment).delete();
  }
}

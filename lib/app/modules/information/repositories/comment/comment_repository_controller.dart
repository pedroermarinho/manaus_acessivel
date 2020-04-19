import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';
import 'package:mobx/mobx.dart';
import 'repository/comment_repository_interface.dart';

part 'comment_repository_controller.g.dart';

class CommentRepositoryController = _CommentRepositoryControllerBase
    with _$CommentRepositoryController;

abstract class _CommentRepositoryControllerBase with Store {
  final _commentRepository = Modular.get<ICommentRepository>();

  /// Todos os comentarios do Marcador
  ///
  /// A busca é feita atraves do id do marcador
  Stream<QuerySnapshot> getComments(String idMarker) {
    return _commentRepository.getComments(idMarker);
  }

  /// Salvar novo comentario
  ///
  /// A ação é feita atravez de um instacia do objeto
  Future saveComment(CommentModel comment) {
    return _commentRepository.saveComment(comment);
  }

  /// Deletar um comentario
  ///
  /// A ação é feita atravez de um instacia do objeto
  Future deleteComment(CommentModel comment) {
    return _commentRepository.deleteComment(comment.idComment);
  }

  /// Deletar todos comentarios
  ///
  /// A ação é feita atravez do id do Marcador
  Future deleteAllComment(String idMarker) {
    return _commentRepository.deleteAllComment(idMarker);
  }
}

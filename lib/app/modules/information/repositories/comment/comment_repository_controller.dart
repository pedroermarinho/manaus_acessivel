import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';

import 'repository/comment_repository_interface.dart';

part 'comment_repository_controller.g.dart';

class CommentRepositoryController = _CommentRepositoryControllerBase
    with _$CommentRepositoryController;

abstract class _CommentRepositoryControllerBase with Store {
  final _commentRepository = Modular.get<ICommentRepository>();

  /// Todos os comentarios do Marcador
  ///
  /// A busca é feita atraves do id do marcador
  Future<List<CommentModel>> getComments(String idMarker) async {
    List<CommentModel> list = List();
    Results results = await _commentRepository.getComments(idMarker);
    for (var data in results) {
      CommentModel comment = CommentModel(
        idComment: data["idComment"],
        idMarker: data["idMarker"],
        idUser: data["idUser"],
        comment: data["comment"],
        dateTime: data["dateTime"],
      );
      list.add(comment);
    }
    return list;
  }

  /// Salvar novo comentario
  ///
  /// A ação é feita atravez de um instacia do objeto
  Future<Results> saveComment(CommentModel comment) {
    return _commentRepository.saveComment(comment);
  }

  /// Deletar um comentario
  ///
  /// A ação é feita atravez de um instacia do objeto
  Future<Results> deleteComment(CommentModel comment) {
    return _commentRepository.deleteComment(comment);
  }

  /// Deletar todos comentarios
  ///
  /// A ação é feita atravez do id do Marcador
  Future<Results> deleteAllComment(String idMarker) {
    return _commentRepository.deleteAllComment(idMarker);
  }
}

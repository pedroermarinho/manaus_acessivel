import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/components/comments/comments_controller.dart';

class CommentsWidget extends StatelessWidget {
  final _controller = Modular.get<CommentsController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Column(
        children: <Widget>[
          Text("Comentarios"),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/home/components/show_favorite_list/show_favorite_list_controller.dart';

class ShowFavoriteListWidget {
  final controller = Modular.get<ShowFavoriteListController>();
  final BuildContext context;

  ShowFavoriteListWidget(
    this.context,
  ) {
    controller.loadList(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Favoritos"),
          scrollable: true,
          content: Container(
            child: Center(
              child: Observer(
                builder: (_) {
                  return Column(children: controller.listWidget.toList());
                },
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Fechar",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

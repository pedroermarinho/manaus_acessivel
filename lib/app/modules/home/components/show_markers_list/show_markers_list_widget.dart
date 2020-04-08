import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manausacessivel/app/modules/home/components/show_markers_list/show_markers_list_controller.dart';

class ShowMarkersListWidget {
  final controller = Modular.get<ShowMarkersListController>();
  final BuildContext context;

  Widget itemListTile(
      {String labelText = "",
      IconData icon = Icons.accessible,
      Function onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        labelText,
        style: TextStyle(fontSize: 16),
      ),
      leading: Icon(
        icon,
        size: 40,
        color: Color(0xffe6c131),
      ),
    );
  }

  ShowMarkersListWidget(
    this.context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Categorias"),
          scrollable: true,
          content: Column(
            children: <Widget>[
              itemListTile(
                icon: FontAwesomeIcons.accessibleIcon,
                labelText: "Deficiência Motora",
                onTap: () {
                  controller.getDM();
                  Navigator.pop(context);
                },
              ),
              itemListTile(
                  icon: FontAwesomeIcons.blind,
                  labelText: "Deficiência Visual",
                  onTap: () {
                    controller.getDV();
                    Navigator.pop(context);
                  }),
              itemListTile(
                icon: FontAwesomeIcons.signLanguage,
                labelText: "Deficiência Auditiva",
                onTap: () {
                  controller.getDA();
                  Navigator.pop(context);
                },
              ),
              itemListTile(
                icon: FontAwesomeIcons.brain,
                labelText: "Deficiência Intelectual",
                onTap: () {
                  controller.getDI();
                  Navigator.pop(context);
                },
              ),
              itemListTile(
                icon: Icons.all_inclusive,
                labelText: "Todas as categorias",
                onTap: () {
                  controller.getALL();
                  Navigator.pop(context);
                },
              ),
            ],
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

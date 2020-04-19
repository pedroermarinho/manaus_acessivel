import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowDialogCustomWidget {
  final String labelText;
  final String title;
  final IconData icon;
  final BuildContext context;

  ShowDialogCustomWidget(
    this.context, {
    this.labelText = "",
    this.icon = Icons.info,
    this.title = "Informação",
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          scrollable: true,
          content: Row(
            children: <Widget>[
              FaIcon(
                icon,
                size: 40,
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  labelText,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          contentPadding: EdgeInsets.all(20),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Ok",
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

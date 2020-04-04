import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manausacessivel/app/components/show_dialog_custom/show_dialog_custom_widget.dart';

class MarkerIconDetectorWidget extends StatelessWidget {
  final String labelText;
  final IconData icon;

  const MarkerIconDetectorWidget({Key key, this.labelText, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: FaIcon(
          icon,
          size: 50,
          color: Colors.black,
        ),
        onTap: () {
          ShowDialogCustomWidget(
              context,
              title: "Categoria",
              labelText: labelText,
              icon: icon
          );
        },
      ),
    );
  }
}

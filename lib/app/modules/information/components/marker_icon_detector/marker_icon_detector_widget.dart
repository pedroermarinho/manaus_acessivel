import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Categoria"),
                content: Row(
                  children: <Widget>[
                    FaIcon(
                      icon,
                      size: 40,
                      color: Color(0xffe6c131),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
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
        },
      ),
    );
  }
}

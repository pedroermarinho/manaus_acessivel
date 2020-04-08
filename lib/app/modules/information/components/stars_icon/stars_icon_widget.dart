import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/components/stars_icon/stars_icon_controller.dart';

class StarsIconWidget extends StatelessWidget {
  final _controller = Modular.get<StarsIconController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
            iconSize: 45,
          ),
        ],
      );
    });
  }
}

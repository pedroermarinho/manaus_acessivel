import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/components/stars_icon/stars_icon_controller.dart';

class StarsIconWidget extends StatelessWidget {
  final controller = Modular.get<StarsIconController>();
  final bool star1;

  final bool star2;

  final bool star3;
  final bool star4;
  final bool star5;
  final Function(int value) function;

  StarsIconWidget({
    Key key,
    this.star1,
    this.star2,
    this.star3,
    this.star4,
    this.star5,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(star1 ? Icons.star : Icons.star_border),
            onPressed: () {
              function(1);
            },
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(star2 ? Icons.star : Icons.star_border),
            onPressed: () {
              function(2);
            },
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(star3 ? Icons.star : Icons.star_border),
            onPressed: () {
              function(3);
            },
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(star4 ? Icons.star : Icons.star_border),
            onPressed: () {
              function(4);
            },
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(star5 ? Icons.star : Icons.star_border),
            onPressed: () {
              function(5);
            },
            iconSize: 45,
          ),
        ],
      );
  }
}

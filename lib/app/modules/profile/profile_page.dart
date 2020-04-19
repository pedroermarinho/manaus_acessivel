import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/shared/utils/user_util.dart';

import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;

  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: ClipPath(
        clipper: ClipProfile(),
        child: Container(
          height: double.infinity,
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 25,
                left: 20,
                right: 5,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Observer(
                        builder: (_) {
                          return CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70,
                            backgroundImage: controller.user == null
                                ? NetworkImage(
                                    UserUtil.caminhoFotoUser,
                                  )
                                : NetworkImage(
                                    controller.user.pathPhoto,
                                  ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Observer(
                          builder: (_) {
                            return Text(
                              controller.user == null
                                  ? ""
                                  : controller.user.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.my_location,
                          size: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Observer(
                          builder: (_) {
                            return Text(
                              "Marcadores: ${controller.markersLength}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          size: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Favoritos:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

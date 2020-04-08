import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/user_model.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';
import 'package:mobx/mobx.dart';

part 'sidebar_controller.g.dart';

class SidebarController = _SidebarControllerBase with _$SidebarController;

abstract class _SidebarControllerBase with Store {
  final _userRepositoryController = Modular.get<UserRepositoryController>();
  final _authController = Modular.get<AuthRepositoryController>();

  @observable
  User user;

  @observable
  bool loading = false;

  @observable
  AnimationController animationController;

  @observable
  // ignore: close_sinks
  StreamController<bool> isSidebarOpenedStreamController;

  @observable
  Stream<bool> isSidebarOpenedStream;

  @observable
  StreamSink<bool> isSidebarOpenedSink;

  _SidebarControllerBase() {
    getUser();
  }

  @action
  getUser() async {
    await _userRepositoryController.getUser();
    autorun((value) {
      if (_userRepositoryController.user != null) {
        value.dispose();
        this.user = _userRepositoryController.user;
      }
    });
  }

  logoutUser() async {
    await _authController.logout();
    _authController.setUser(null);
    _userRepositoryController.setUser(null);
    pushSplashScreen();
  }

  pushSplashScreen() {
    Modular.to.pushReplacementNamed(Modular.initialRoute);
  }

  pushSettings() {
    Modular.to.pushNamed("/settings").whenComplete(() => getUser());
  }

  pushAbout() {
    Modular.to.pushNamed("/about");
  }

  pushProfile() {
    Modular.to.pushNamed("/profile");
  }

  final animationDuration = const Duration(milliseconds: 500);

  void onIconPressed() {
    final animationStatus = animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      animationController.forward();
    }
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
//    Paint paint = Paint();
//    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

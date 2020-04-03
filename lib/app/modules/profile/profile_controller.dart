import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/user_model.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final _userRepositoryController = Modular.get<UserRepositoryController>();

  @observable
  User user;

  @observable
  bool loading = false;


  _ProfileControllerBase(){
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



}


class ClipProfile extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 3.8);

    var controlPoint = Offset(size.width / 1.3, (size.height / 1.7));
    var endPoint = Offset(0, size.height / 1.6);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
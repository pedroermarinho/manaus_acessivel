import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/shared/auth/repository/auth_repository_interface.dart';
import 'package:manausacessivel/app/shared/utils/user_util.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  FirebaseUser userAuth;

  @observable
  AuthStatus status = AuthStatus.loading;

  @action
  setUser(FirebaseUser value) {
    userAuth = value;
    status = userAuth == null ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  Future loginWithGoogle() async {
    await _authRepository.getEmailGoogleLogin().whenComplete(() {
      _authRepository.getUser().then(setUser);
    });
  }

  Future loginWithEmailPasswordLogin(String email, String password) async {
    _authRepository.getEmailPasswordLogin(email, password).whenComplete(() {
      _authRepository.getUser().then(setUser);
    });
  }

  Future logout() {
    return _authRepository.logout().whenComplete(() {
      _authRepository.getUser().then(setUser);
    });
  }
}

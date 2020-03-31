import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/user.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:manausacessivel/app/shared/auth/auth_controller.dart';
import 'package:manausacessivel/app/shared/utils/type_user.dart';
import 'package:manausacessivel/app/shared/utils/user_util.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  UserRepositoryController _userController =
      Modular.get<UserRepositoryController>();

  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String messageError = "";

  @action
  setEmail(String value) => email = value;

  @action
  setPassword(String value) => password = value;

  @action
  setName(String value) => name = value;

  @action
  Future registerUser() async {
    messageError = "";
    try {
      loading = true;

      Usuario user = Usuario();
      user.nome = name;
      user.email = email;
      user.senha = password;
      user.userType = TypeUser.novoUsuario;
      user.caminhoFoto = UserUtil.caminhoFotoUser;

      await _userController.setUser(user);

      await _userController.registerUser().then((value) {
        pushHome();
      }).catchError((error) {
        PlatformException exception = error;
        print(exception.code);
        String mensagemException = "";

        if (exception.code == "ERROR_USER_NOT_FOUND") {
          mensagemException += "\nUsuário não encontrado!";
        }
        if (exception.code == "ERROR_WRONG_PASSWORD") {
          mensagemException += "\nSenha incorreta!";
        }
        if (exception.code == "ERROR_EMAIL_ALREADY_IN_USE") {
          mensagemException += "\nE-mail já cadastrado!";
        }
        loading = false;

        messageError =
            "Erro ao autenticar usuário, verifique e-mail e senha e tente novamente!" +
                mensagemException;
      });
    } catch (e) {
      loading = false;
    }
  }

  Future pushHome() {
    return Modular.to.pushReplacementNamed("/home");
  }

  @computed
  bool get isValid {
    return validateEmail() == null &&
        validatePassword() == null &&
        validateName() == null;
  }

  String validateEmail() {
    if (email == null || email.isEmpty) {
      return "O campo E-mail é obrigatório";
    }
    if (!email.contains("@")) {
      return "Esse E-mail não é válido";
    }
    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return "O campo Senha é obrigatório";
    }
    if (password.length < 6) {
      return "A Senha precisa ter mais mais de 6 caracteres";
    }
    return null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo Nome é obrigatório";
    }
    if (name.length < 3) {
      return "O nome precisa ter mais mais de 3 caracteres";
    }
    return null;
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/user.dart';
import 'package:manausacessivel/app/repositories/user/repository/user_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'user_repository_controller.g.dart';

class UserRepositoryController = _UserRepositoryControllerBase
    with _$UserRepositoryController;

abstract class _UserRepositoryControllerBase with Store {
  final IUserRepository _userRepository = Modular.get<IUserRepository>();

  @observable
  Usuario user;

  @action
  setUser(Usuario value) => user = value;

  _UserRepositoryControllerBase() {
    getUser();
  }

  Future deleteUser() {
    return _userRepository.deleteUser();
  }

  Future<Usuario> getUser() async {
    DocumentSnapshot snapshot = await _userRepository.getUser();
    Map<String, dynamic> data = snapshot.data;
    Usuario userLocal = Usuario();
    if (data.length != 0) {
      userLocal.idUsuario = snapshot.documentID;
      userLocal.nome = data["nome"];
      userLocal.email = data["email"];
      userLocal.userType = data["userType"];
      userLocal.caminhoFoto = data["caminhoFoto"];
      setUser(userLocal);
    }
    return userLocal;
  }

  Future saveUser() {
    return _userRepository.saveUser(user);
  }

  Future updateUser() {
    return _userRepository.updateUser(user);
  }

  Future registerUser() {
    return _userRepository.registerUser(user);
  }

  Future<StorageUploadTask> uploadImageUser(File fileImage) {
    return _userRepository.uploadImageUser(fileImage);
  }
}

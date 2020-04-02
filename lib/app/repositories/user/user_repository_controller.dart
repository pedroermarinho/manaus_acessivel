import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/models/user_model.dart';
import 'package:manausacessivel/app/repositories/user/repository/user_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'user_repository_controller.g.dart';

class UserRepositoryController = _UserRepositoryControllerBase
    with _$UserRepositoryController;

abstract class _UserRepositoryControllerBase with Store {
  final IUserRepository _userRepository = Modular.get<IUserRepository>();

  @observable
  User user;

  @action
  setUser(User value) => user = value;

  _UserRepositoryControllerBase() {
    getUser();
  }

  Future deleteUser() {
    return _userRepository.deleteUser();
  }

  Future<User> getUser() async {
    DocumentSnapshot snapshot = await _userRepository.getUser();
    Map<String, dynamic> data = snapshot.data;
    if (data.length != 0) {
      User userLocal = User(
        idUser: snapshot.documentID,
        name: data["name"],
        email: data["email"],
        userType: data["userType"],
        pathPhoto: data["pathPhoto"],
      );
      setUser(userLocal);
      return user;
    } else {
      return null;
    }
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

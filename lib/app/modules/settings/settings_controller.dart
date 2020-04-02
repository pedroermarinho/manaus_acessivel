import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manausacessivel/app/models/user_model.dart';
import 'package:manausacessivel/app/repositories/user/user_repository_controller.dart';
import 'package:mobx/mobx.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  final _userRepositoryController = Modular.get<UserRepositoryController>();

  @observable
  User user;

  @observable
  bool loading = false;

  @observable
  File images;

  @observable
  String name;

  @action
  setName(String value) => name = value;

  _SettingsControllerBase() {
    getUser();
  }

  bool get isValid {
    bool isValidName;
    bool isValidImage;

    if (validateName() == null) {
      if (name != user.name) {
        isValidName = true;
      } else {
        isValidName = false;
      }
    } else {
      isValidName = false;
    }

    if (validateImage() == null) {
      isValidImage = true;
    } else {
      isValidImage = false;
    }
    return isValidName || isValidImage;
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

  String validateImage() {
    if (images == null) {
      return "Selecione uma Imagem";
    }
    return null;
  }

  @action
  getUser() async {
    await _userRepositoryController.getUser();
    this.user = _userRepositoryController.user;
    this.name = user.name;
  }

  Future getImage(String sourceImage) async {
    File selectImage;

    switch (sourceImage) {
      case "camera":
        selectImage = await ImagePicker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        selectImage = await ImagePicker.pickImage(source: ImageSource.gallery);
        break;
    }
    images = selectImage;
  }

  void uploadImage() async {
    StorageUploadTask task =
        await _userRepositoryController.uploadImageUser(images);

    task.events.listen((StorageTaskEvent storageTaskEvent) {
      if (storageTaskEvent.type == StorageTaskEventType.progress) {
        print("carregando");
        loading = true;
      } else if (storageTaskEvent.type == StorageTaskEventType.success) {
        getUser();
        print("finalizado");
        loading = false;
      }
    });
  }

  updateUser() {
    loading = true;
    user.name = name;

    _userRepositoryController.setUser(user);
    _userRepositoryController.saveUser().whenComplete(() {
      getUser();
      loading = false;
    });
  }

  save() {
    if (validateName() == null) {
      if (this.name != this.user.name) {
        updateUser();
      }
    }
    if (validateImage() == null) {
      uploadImage();
    }
  }
}

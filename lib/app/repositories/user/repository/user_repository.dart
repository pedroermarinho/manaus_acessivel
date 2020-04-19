import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:manausacessivel/app/models/user_model.dart';
import 'package:manausacessivel/app/repositories/user/repository/user_repository_interface.dart';
import 'package:manausacessivel/app/shared/auth/auth_repository_controller.dart';

class UserRepository implements IUserRepository {
  final Firestore _firestore = Firestore.instance;
  final String _collectionDB = "users";
  final String _childProfileUser = "profiles";
  final AuthRepositoryController _authController = Modular.get();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future deleteUser() {
    return _firestore
        .collection(_collectionDB)
        .document(_authController.userAuth.uid)
        .delete();
  }

  @override
  Future<DocumentSnapshot> getUser() {
    return _firestore
        .collection(_collectionDB)
        .document(_authController.userAuth.uid)
        .get();
  }

  @override
  Future<DocumentSnapshot> getUserId(String idUser) async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection(_collectionDB).document(idUser).get();
    return documentSnapshot;
  }

  @override
  Future saveUser(User user) {
    return _firestore
        .collection(_collectionDB)
        .document(_authController.userAuth.uid)
        .setData(user.toMap());
  }

  @override
  Future updateUser(User user) {
    return _firestore
        .collection(_collectionDB)
        .document(_authController.userAuth.uid)
        .updateData(user.toMap());
  }

  @override
  Future registerUser(User user) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password)
        .then((value) {
      _firestore
          .collection(_collectionDB)
          .document(value.user.uid)
          .setData(user.toMap());
    });
  }

  @override
  Future<StorageUploadTask> uploadImageUser(File fileImage) async {
    File image = await compressImage(fileImage);

    StorageReference pastaRaiz = _storage.ref();
    StorageReference arquivo = pastaRaiz
        .child(_childProfileUser)
        .child(_authController.userAuth.uid + ".jpg");

    StorageUploadTask task = arquivo.putFile(image);

    task.events.listen((StorageTaskEvent storageTaskEvent) {
      if (storageTaskEvent.type == StorageTaskEventType.success) {}
    });

    task.onComplete.then(_recoverUrlImage);

    return task;
  }

  Future<File> compressImage(File fileImage) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(fileImage.path);

    File compressedFile = await FlutterNativeImage.compressImage(
      fileImage.path,
      quality: 80,
      targetWidth: 256,
      targetHeight: (properties.height * 256 / properties.width).round(),
    );
    return compressedFile;
  }

  _recoverUrlImage(StorageTaskSnapshot snapshot) async {
    String downloadURL = await snapshot.ref.getDownloadURL();
    _firestore
        .collection(_collectionDB)
        .document(_authController.userAuth.uid)
        .updateData({"pathPhoto": downloadURL});
  }
}

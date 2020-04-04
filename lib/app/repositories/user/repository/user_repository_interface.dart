import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:manausacessivel/app/models/user_model.dart';

abstract class IUserRepository {
  Future<DocumentSnapshot> getUser();

  Future deleteUser();

  Future saveUser(User user);

  Future<DocumentSnapshot> getUserId(String idUser);

  Future updateUser(User user);

  Future registerUser(User user);

  Future<StorageUploadTask> uploadImageUser(File fileImage);
}

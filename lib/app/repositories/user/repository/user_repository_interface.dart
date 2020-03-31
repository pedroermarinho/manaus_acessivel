import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:manausacessivel/app/models/user.dart';

abstract class IUserRepository {
  Future<DocumentSnapshot> getUser();

  Future deleteUser();

  Future saveUser(Usuario user);

  Future updateUser(Usuario user);

  Future registerUser(Usuario user);

  Future<StorageUploadTask> uploadImageUser(File fileImage);
}

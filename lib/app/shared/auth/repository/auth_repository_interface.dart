import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();

  Future<FirebaseUser> getEmailPasswordLogin(String email, String password);

  Future<FirebaseUser> getEmailGoogleLogin();

  Future getEmailFacebookLogin();

  Future logout();
}

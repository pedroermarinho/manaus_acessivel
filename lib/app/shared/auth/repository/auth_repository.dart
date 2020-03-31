import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manausacessivel/app/models/user.dart';
import 'package:manausacessivel/app/shared/auth/repository/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future getEmailFacebookLogin() {
    // TODO: implement getEmailFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getEmailGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<FirebaseUser> getEmailPasswordLogin(
      String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
  }

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  @override
  Future logout() {
    return _auth.signOut();
  }
}

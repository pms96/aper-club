import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../domain/entities/user.dart' as myapp;
import '../../domain/usecases/auth_usecase.dart';

class AuthUseCaseImpl implements AuthUseCase {
  final firebase.FirebaseAuth _firebaseAuth = firebase.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<myapp.User?> signInWithEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<myapp.User?> signUpWithEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<myapp.User?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = firebase.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<myapp.User?> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();
    final credential = firebase.FacebookAuthProvider.credential(result.accessToken!.token);

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<myapp.User?> signInWithApple() async {
    final result = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final credential = firebase.OAuthProvider("apple.com").credential(
      idToken: result.identityToken,
      accessToken: result.authorizationCode,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  myapp.User? _userFromFirebase(firebase.User? user) {
    if (user == null) return null;
    return myapp.User(id: user.uid, email: user.email ?? '', name: user.displayName ?? '');
  }
}

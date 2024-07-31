import 'package:myapp/domain/entities/user.dart';

abstract class AuthUseCase {
  Future<User?> signInWithEmail(String email, String password);
  Future<User?> signUpWithEmail(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<User?> signInWithApple();
  Future<void> signOut();
}

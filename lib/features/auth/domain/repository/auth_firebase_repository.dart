import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  // Credential Features
  Future<void> logInUser({required String email, required String password});
  Future<UserCredential> signUpUser(
      {required String email, required String password});

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);

  // Social Sign In Features
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}

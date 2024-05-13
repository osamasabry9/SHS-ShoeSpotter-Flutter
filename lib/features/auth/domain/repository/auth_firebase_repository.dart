import '../entities/user_entity.dart';

abstract class AuthRepository {
  // Credential Features
  Future<void> logInUser({required String email, required String password});
  Future<void> signUpUser(
      {required UserEntity user,
      required String email,
      required String password});

  Future<void> sendEmailVerification();
  Future<void> forgetPassword();

  Future<void> resetPassword(String email);

  // Social Sign In Features
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();

  Future<void> logoutUser();
  Future<void> deleteUserAccount();
}

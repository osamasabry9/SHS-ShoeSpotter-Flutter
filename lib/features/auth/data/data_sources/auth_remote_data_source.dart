import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  // Credential Features
  Future<void> logInUser({required String email, required String password});
  Future<void> signUpUser(
      {required UserEntity user,
      required String email,
      required String password});

  Future<void> saveUserRecord(UserEntity user);
  Future<void> sendEmailVerification();
  Future<void> forgetPassword();

  Future<void> resetPassword(String email);

  // Social Sign In Features
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();

  // User Features
  Future<String> getCurrentUid();
  Future<void> logoutUser();
  Future<void> deleteUserAccount();
}

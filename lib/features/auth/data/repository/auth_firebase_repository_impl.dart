import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_firebase_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource userRemoteDataSource;

  AuthRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<void> logInUser(
          {required String email, required String password}) async =>
      userRemoteDataSource.logInUser(email: email, password: password);

  @override
  Future<void> signUpUser(
          {required UserEntity user,
          required String email,
          required String password}) async =>
      userRemoteDataSource.signUpUser(
          user: user, email: email, password: password);

  @override
  Future<void> forgetPassword() async => userRemoteDataSource.forgetPassword();

  @override
  Future<void> sendEmailVerification() async =>
      userRemoteDataSource.sendEmailVerification();

  @override
  Future<void> resetPassword(String email) async =>
      userRemoteDataSource.resetPassword(email);
  // Social Sign In Features
  @override
  Future<void> signInWithFacebook() async =>
      userRemoteDataSource.signInWithFacebook();

  @override
  Future<void> signInWithGoogle() async =>
      userRemoteDataSource.signInWithGoogle();
  @override
  Future<void> logoutUser() async => userRemoteDataSource.logoutUser();

  @override
  Future<void> deleteUserAccount() async =>
      userRemoteDataSource.deleteUserAccount();
}

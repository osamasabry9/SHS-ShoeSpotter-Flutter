import 'package:firebase_auth/firebase_auth.dart';

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
  Future<UserCredential> signUpUser(
          {required String email, required String password}) async =>
      userRemoteDataSource.signUpUser(email: email, password: password);

  @override
  Future<void> forgetPassword() async => userRemoteDataSource.forgetPassword();

  @override
  Future<void> sendEmailVerification() async =>
      userRemoteDataSource.sendEmailVerification();

  @override
  Future<void> sendPasswordResetEmail(String email) async =>
      userRemoteDataSource.sendPasswordResetEmail(email);
  // Social Sign In Features
  @override
  Future<UserCredential> signInWithFacebook() async =>
      userRemoteDataSource.signInWithFacebook();

  @override
  Future<UserCredential> signInWithGoogle() async =>
      userRemoteDataSource.signInWithGoogle();
  @override
  Future<void> logoutUser() async => userRemoteDataSource.logoutUser();

  @override
  Future<void> deleteUserAccount() async =>
      userRemoteDataSource.deleteUserAccount();
}

import 'package:firebase_auth/firebase_auth.dart';

import '../repository/auth_firebase_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  Future<UserCredential> call(
      {
      required String email,
      required String password}) {
    return repository.signUpUser( email: email, password: password);
  }
}

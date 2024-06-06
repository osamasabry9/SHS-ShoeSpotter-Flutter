import 'package:firebase_auth/firebase_auth.dart';

import '../repository/auth_firebase_repository.dart';

class SignWithFacebookUseCase {
  final AuthRepository repository;

  SignWithFacebookUseCase({required this.repository});

  Future<UserCredential> call() async {
    return await repository.signInWithFacebook();
  }
}
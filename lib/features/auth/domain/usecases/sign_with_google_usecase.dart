import 'package:firebase_auth/firebase_auth.dart';
import '../repository/auth_firebase_repository.dart';

class SignWithGoogleUseCase {
  final AuthRepository repository;

  SignWithGoogleUseCase({required this.repository});

  Future<UserCredential> call() async {
    return await repository.signInWithGoogle();
  }
}
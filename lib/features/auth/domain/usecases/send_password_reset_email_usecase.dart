import '../repository/auth_firebase_repository.dart';

class SendPasswordResetEmailUseCase {
   final AuthRepository repository;

  SendPasswordResetEmailUseCase({required this.repository});

  Future<void> call({required String email}) async{
    await repository.sendPasswordResetEmail(email);
  }
}

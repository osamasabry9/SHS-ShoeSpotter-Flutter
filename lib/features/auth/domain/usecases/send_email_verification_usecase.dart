import '../repository/auth_firebase_repository.dart';

class SendEmailVerificationUseCase {
  final AuthRepository repository;

  SendEmailVerificationUseCase({required this.repository});

  Future<void> call() {
    return repository.sendEmailVerification();
  }
}

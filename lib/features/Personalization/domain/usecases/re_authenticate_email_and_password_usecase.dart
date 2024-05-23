import '../repositories/personalization_repository.dart';

class ReAuthenticateEmailAndPasswordUseCase {
  final PersonalizationRepository repository;

  ReAuthenticateEmailAndPasswordUseCase({required this.repository});

  Future<void> call({required String email, required String password}) async {
    return await repository.reAuthenticateEmailAndPassword(email, password);
  }
}

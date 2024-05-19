import '../repositories/personalization_repository.dart';

class LogoutUserUseCase {
  final PersonalizationRepository repository;

  LogoutUserUseCase({required this.repository});

  Future<void> call() async {
    return await repository.logoutUser();
  }
}

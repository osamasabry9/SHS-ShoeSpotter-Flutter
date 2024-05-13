import '../repository/auth_firebase_repository.dart';

class LogoutUserUseCase {
    final AuthRepository repository;

  LogoutUserUseCase({required this.repository});

  Future<void> call()async {
    return await repository.logoutUser();
  }
}
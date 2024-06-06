import '../repository/auth_firebase_repository.dart';

class LogInUserUseCase {
  final AuthRepository repository;

  LogInUserUseCase({required this.repository});

  Future<void> call({required String email, required String password}) {
    return repository.logInUser(email: email, password: password);
  }
}

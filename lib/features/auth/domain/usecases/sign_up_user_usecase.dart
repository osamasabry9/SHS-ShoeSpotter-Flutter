import '../entities/user_entity.dart';
import '../repository/auth_firebase_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(
      {required UserEntity user,
      required String email,
      required String password}) {
    return repository.signUpUser(user: user, email: email, password: password);
  }
}

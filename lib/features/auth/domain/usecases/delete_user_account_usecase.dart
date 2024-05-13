import '../repository/auth_firebase_repository.dart';

class DeleteUserAccountUseCase{
      final AuthRepository repository;

  DeleteUserAccountUseCase({required this.repository});

  Future<void> call()async {
    return await repository.deleteUserAccount();
  }

}
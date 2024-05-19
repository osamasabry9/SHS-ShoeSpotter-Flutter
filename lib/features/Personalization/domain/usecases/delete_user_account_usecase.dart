import '../repositories/personalization_repository.dart';

class DeleteUserAccountUseCase{
      final PersonalizationRepository repository;

  DeleteUserAccountUseCase({required this.repository});

  Future<void> call()async {
    return await repository.deleteUserAccount();
  }

}
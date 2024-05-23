import '../../../auth/data/models/user_model.dart';
import '../repositories/personalization_repository.dart';

class UpdateUserDetailsUseCase {
  final PersonalizationRepository repository;

  UpdateUserDetailsUseCase({required this.repository});

  Future<void> call(UserModel user) async {
    return await repository.updateUserDetails(user);
  }
}

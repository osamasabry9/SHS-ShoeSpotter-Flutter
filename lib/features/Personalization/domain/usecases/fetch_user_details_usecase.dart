import '../../../auth/data/models/user_model.dart';
import '../repositories/personalization_repository.dart';

class FetchUserDetailsUseCase{
  final PersonalizationRepository repository;
  FetchUserDetailsUseCase({required this.repository});
  Future<UserModel> call()async{
    return await repository.fetchUserDetails();
  }
}
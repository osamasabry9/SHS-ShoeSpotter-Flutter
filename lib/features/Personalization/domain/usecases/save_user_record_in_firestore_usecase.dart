import '../../../auth/data/models/user_model.dart';
import '../repositories/personalization_repository.dart';

class SaveUserRecordInFirestoreUseCase {
  final PersonalizationRepository repository; 

  SaveUserRecordInFirestoreUseCase({required this.repository});

  Future<void> call(UserModel user) async {
    return await repository.saveUserRecordInFirestore(user);
  }
}
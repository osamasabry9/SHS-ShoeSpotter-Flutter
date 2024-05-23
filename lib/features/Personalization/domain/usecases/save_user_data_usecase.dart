import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/personalization_repository.dart';

class SaveUserDataUseCase {
  final PersonalizationRepository repository;

  SaveUserDataUseCase({required this.repository});

  Future<void> call(UserCredential? userCredential) async {
    return await repository.saveUserData(userCredential);
  }
}

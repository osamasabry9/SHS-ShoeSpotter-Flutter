import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/personalization_repository_impl.dart';


class SaveUserDataUseCase{
  final PersonalizationRepositoryImpl repository;

  SaveUserDataUseCase({required this.repository});

  Future<void> call(UserCredential? userCredential) async {
    return await repository.saveUserData(userCredential);
  }
}
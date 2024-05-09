import 'package:shoe_spotter/features/auth/data/models/sign_up_request.dart';

import '../repositories/user_firebase_repository.dart';

class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(SignUpRequest user) {
    return repository.signUpUser(user);
  }
}

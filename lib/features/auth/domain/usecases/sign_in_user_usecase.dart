import 'package:shoe_spotter/features/auth/data/models/sign_in_request.dart';

import '../repositories/user_firebase_repository.dart';

class SignInUserUseCase {
  final UserRepository repository;

  SignInUserUseCase({required this.repository});

  Future<void> call(SignInRequest user ) {
    return repository.signInUser(user);
  }
}

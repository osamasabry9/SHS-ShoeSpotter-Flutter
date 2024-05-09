import '../models/sign_in_request.dart';
import '../models/sign_up_request.dart';

abstract class UserRemoteDataSource {
  // Credential
  Future<void> signInUser(SignInRequest user);
  Future<void> signUpUser(SignUpRequest user);

  Future<void> createUser(SignUpRequest user);
  Future<String> getCurrentUid();
}

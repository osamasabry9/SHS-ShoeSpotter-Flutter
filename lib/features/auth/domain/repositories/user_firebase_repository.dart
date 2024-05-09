
import '../../data/models/sign_in_request.dart';
import '../../data/models/sign_up_request.dart';

abstract class UserRepository {
  Future<void> signInUser(SignInRequest user);
  Future<void> signUpUser(SignUpRequest user);
 
}

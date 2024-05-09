

import '../../domain/repositories/user_firebase_repository.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/sign_in_request.dart';
import '../models/sign_up_request.dart';



class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});



  @override
  Future<void> signInUser(SignInRequest user) async =>
      userRemoteDataSource.signInUser(user);


  @override
  Future<void> signUpUser(SignUpRequest user) async =>
      userRemoteDataSource.signUpUser(user);


}

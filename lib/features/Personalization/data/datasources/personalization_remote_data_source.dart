import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/models/user_model.dart';

abstract class PersonalizationRemoteDataSource {
  Future<void> saveUserRecordInFirestore(UserModel user);

  Future<void> saveUserData(UserCredential? userCredential);

  Future<void> logoutUser();

  Future<void> deleteUserAccount();
}

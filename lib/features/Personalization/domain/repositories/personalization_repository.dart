import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/models/user_model.dart';

abstract class PersonalizationRepository {
  Future<void> saveUserData(UserCredential? userCredential);
  Future<void> saveUserRecordInFirestore(UserModel user);
  Future<void> deleteUserAccount();
  Future<void> logoutUser();
}
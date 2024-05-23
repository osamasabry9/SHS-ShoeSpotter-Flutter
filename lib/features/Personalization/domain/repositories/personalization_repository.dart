import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../../auth/data/models/user_model.dart';

abstract class PersonalizationRepository {
  Future<void> saveUserData(UserCredential? userCredential);
  Future<void> saveUserRecordInFirestore(UserModel user);
  Future<UserModel> fetchUserDetails();
  Future<void> updateSingleField(Map<String, dynamic> jsonField);
  Future<void> updateUserDetails(UserModel user);
  Future<String> uploadImage(String path, XFile image);
  Future<void> reAuthenticateEmailAndPassword(String email, String password);
  Future<void> deleteUserAccount();
  Future<void> logoutUser();
}

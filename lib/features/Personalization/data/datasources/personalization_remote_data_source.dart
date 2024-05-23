import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../../auth/data/models/user_model.dart';

abstract class PersonalizationRemoteDataSource {
  Future<void> saveUserRecordInFirestore(UserModel user);

  Future<void> saveUserData(UserCredential? userCredential);

  Future<UserModel> fetchUserDetails();

  Future<void> updateUserDetails(UserModel user);
  Future<void> updateSingleField(Map<String, dynamic> jsonField);
   Future<String> uploadImage(String path, XFile image);

  Future<void> reAuthenticateEmailAndPassword(String email, String password );

  Future<void> logoutUser();

  Future<void> deleteUserAccount();
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../../auth/data/models/user_model.dart';
import '../../domain/repositories/personalization_repository.dart';
import '../datasources/personalization_remote_data_source.dart';

class PersonalizationRepositoryImpl implements PersonalizationRepository {
  final PersonalizationRemoteDataSource personalizationRemoteDataSource;
  PersonalizationRepositoryImpl(
      {required this.personalizationRemoteDataSource});
@override
  Future<void> reAuthenticateEmailAndPassword(String email, String password ) async => personalizationRemoteDataSource.reAuthenticateEmailAndPassword(email, password);
  @override
  Future<void> deleteUserAccount() async =>
      personalizationRemoteDataSource.deleteUserAccount();

  @override
  Future<void> logoutUser() async =>
      personalizationRemoteDataSource.logoutUser();

  @override
  Future<void> saveUserData(UserCredential? userCredential) async =>
      personalizationRemoteDataSource.saveUserData(userCredential);

  @override
  Future<void> saveUserRecordInFirestore(UserModel user) async =>
      personalizationRemoteDataSource.saveUserRecordInFirestore(user);
  @override
  Future<UserModel> fetchUserDetails() async =>
      personalizationRemoteDataSource.fetchUserDetails();

  @override
  Future<void> updateUserDetails(UserModel user) async =>
      personalizationRemoteDataSource.updateUserDetails(user);

  @override
  Future<void> updateSingleField(Map<String, dynamic> jsonField) async =>
      personalizationRemoteDataSource.updateSingleField(jsonField);

  @override
  Future<String> uploadImage(String path, XFile image) async =>
      personalizationRemoteDataSource.uploadImage(path, image);
}

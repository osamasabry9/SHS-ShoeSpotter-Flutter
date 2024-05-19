import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoe_spotter/features/Personalization/data/datasources/personalization_remote_data_source.dart';
import 'package:shoe_spotter/features/auth/data/models/user_model.dart';

import '../../domain/repositories/personalization_repository.dart';

class PersonalizationRepositoryImpl implements PersonalizationRepository {
  final PersonalizationRemoteDataSource personalizationRemoteDataSource;
  PersonalizationRepositoryImpl({required this.personalizationRemoteDataSource});

  @override
  Future<void> deleteUserAccount()  async => personalizationRemoteDataSource.deleteUserAccount();

  @override
  Future<void> logoutUser() async => personalizationRemoteDataSource.logoutUser();

  @override
  Future<void> saveUserData(UserCredential? userCredential) async => personalizationRemoteDataSource.saveUserData(userCredential);

  @override
  Future<void> saveUserRecordInFirestore(UserModel user) async => personalizationRemoteDataSource.saveUserRecordInFirestore(user);
  
  }
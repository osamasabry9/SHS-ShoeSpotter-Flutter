import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';


import '../core/local_storage/storage_utility.dart';
import '../features/Personalization/data/datasources/personalization_remote_data_source.dart';
import '../features/Personalization/data/datasources/personalization_remote_data_source_impl.dart';
import '../features/Personalization/data/repositories/personalization_repository_impl.dart';
import '../features/Personalization/domain/repositories/personalization_repository.dart';
import '../features/Personalization/domain/usecases/delete_user_account_usecase.dart';
import '../features/Personalization/domain/usecases/logout_user_usecase.dart';
import '../features/Personalization/domain/usecases/save_user_data_usecase.dart';
import '../features/Personalization/domain/usecases/save_user_record_in_firestore_usecase.dart';
import '../features/auth/data/data_sources/auth_remote_data_source.dart';
import '../features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import '../features/auth/data/repository/auth_firebase_repository_impl.dart';
import '../features/auth/domain/repository/auth_firebase_repository.dart';
import '../features/auth/domain/usecases/send_email_verification_usecase.dart';
import '../features/auth/domain/usecases/send_password_reset_email_usecase.dart';
import '../features/auth/domain/usecases/login_user_usecase.dart';
import '../features/auth/domain/usecases/sign_up_user_usecase.dart';
import '../features/auth/domain/usecases/sign_with_facebook_usecase.dart';
import '../features/auth/domain/usecases/sign_with_google_usecase.dart';


final getIt = GetIt.instance;

Future<void> initAppModule() async {
  //    GetStorage instance
  await GetStorage.init();
  getIt.registerLazySingleton<GetStorage>(() => GetStorage());

  // app prefs instance
  getIt.registerLazySingleton<AppLocalStorage>(() => AppLocalStorage());
  // --------------------------Use Cases--------------------

  //++++++++++++++++++++++++++++  Auth Use Cases +++++++++++++++++++++++++++
  getIt.registerLazySingleton(() => SignUpUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(() => LogInUserUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(
      () => SignWithGoogleUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(
      () => SignWithFacebookUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(
      () => SendEmailVerificationUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(
      () => SendPasswordResetEmailUseCase(repository: getIt.call()));

  //+++++++++++++++++++++++  Personalization Use Cases +++++++++++++++++++++++
  getIt
      .registerLazySingleton(() => LogoutUserUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(
      () => DeleteUserAccountUseCase(repository: getIt.call()));

  getIt.registerLazySingleton(
      () => SaveUserDataUseCase(repository: getIt.call()));

  getIt.registerLazySingleton(
      () => SaveUserRecordInFirestoreUseCase(repository: getIt.call()));

  // -----------------------------Repository-----------------------
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(userRemoteDataSource: getIt.call()),
  );

  getIt.registerLazySingleton<PersonalizationRepository>(
    () => PersonalizationRepositoryImpl(personalizationRemoteDataSource: getIt.call()),
  );  

  // -------------------------------- Remote Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
            firebaseFirestore: getIt.call(),
            firebaseAuth: getIt.call(),
            firebaseStorage: getIt.call(),
          ));

  getIt.registerLazySingleton<PersonalizationRemoteDataSource>(
      () => PersonalizationRemoteDataSourceImpl(
            firebaseFirestore: getIt.call(),
            firebaseAuth: getIt.call(),
            firebaseStorage: getIt.call(),
          ));

  //--------------------------- Externals-----------------------------------

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  getIt.registerLazySingleton(() => firebaseFirestore);
  getIt.registerLazySingleton(() => firebaseAuth);
  getIt.registerLazySingleton(() => firebaseStorage);
}

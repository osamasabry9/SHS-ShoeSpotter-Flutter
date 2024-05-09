import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoe_spotter/core/local_storage/storage_utility.dart';
import 'package:shoe_spotter/features/auth/presentation/cubit/sign_up_cubit.dart';

import '../features/auth/data/datasources/user_remote_data_source.dart';
import '../features/auth/data/datasources/user_remote_data_source_impl.dart';
import '../features/auth/data/repositories/user_firebase_repository_impl.dart';
import '../features/auth/domain/repositories/user_firebase_repository.dart';
import '../features/auth/domain/usecases/sign_in_user_usecase.dart';
import '../features/auth/domain/usecases/sign_up_user_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //    GetStorage instance
  await GetStorage.init();
  instance.registerLazySingleton<GetStorage>(() => GetStorage());

  // app prefs instance
  instance.registerLazySingleton<AppLocalStorage>(() => AppLocalStorage());

// Cubits
  instance.registerFactory(
    () => SignUpCubit(instance.call(), instance.call()),
  );

  // UseCase
    instance
      .registerLazySingleton(() => SignUpUseCase(repository: instance.call()));
  instance.registerLazySingleton(
      () => SignInUserUseCase(repository: instance.call()));

  // Repository
    instance.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSource: instance.call()),
  );
  // Data sources
    instance.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(
            firebaseFirestore: instance.call(),
            firebaseAuth: instance.call(),
            firebaseStorage: instance.call(),
          ));
  // Domain


  //-------------------Externals-----------------------------------

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;

  instance.registerLazySingleton(() => firebaseFirestore);
  instance.registerLazySingleton(() => firebaseAuth);
  instance.registerLazySingleton(() => firebaseStorage);
}

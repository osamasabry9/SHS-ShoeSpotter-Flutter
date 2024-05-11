import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../core/local_storage/storage_utility.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  //    GetStorage instance
  await GetStorage.init();
  getIt.registerLazySingleton<GetStorage>(() => GetStorage());

  // app prefs instance
  getIt.registerLazySingleton<AppLocalStorage>(() => AppLocalStorage());
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/di.dart';
import 'app/t_shoe_spotter_app.dart';
import 'core/repositories/authentication/authentication_repository.dart';
import 'core/utils/constants/api_keys.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Widgets binding
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = AppKeys.publishableKey;

  // Getx Local Storage
  await GetStorage.init();

  // await Splash until other items are loaded
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  // Initialize GetIt
  await initAppModule();

  runApp(TShoeSpotterApp());
}

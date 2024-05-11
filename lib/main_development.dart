import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'core/repositories/authentication/authentication_repository.dart';

import 'app/di.dart';
import 'app/t_shoe_spotter_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Widgets binding
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  // await Splash until other items are loaded
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  // Initialize GetIt
  await initAppModule();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(TShoeSpotterApp());
}

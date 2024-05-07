import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';
import 'app/t_shoe_spotter_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Widgets binding
  //final WidgetsBinding binding =
   WidgetsFlutterBinding.ensureInitialized();
// Initialize GetIt
  await initAppModule();
  // await Splash until other items are loaded
  // FlutterNativeSplash.preserve(widgetsBinding: binding);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TShoeSpotterApp());
}

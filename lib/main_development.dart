import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';
import 'app/t_shoe_spotter_app.dart';

Future<void> main() async {
  // Widgets binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

// Initialize GetIt
 // await initAppModule();

  // await Splash until other items are loaded
  // FlutterNativeSplash.preserve(widgetsBinding: binding);

  runApp(TShoeSpotterApp());
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/t_shoe_spotter_app.dart';
import 'firebase_options.dart';

void main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TShoeSpotterApp());
}

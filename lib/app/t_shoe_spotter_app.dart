import 'package:flutter/material.dart';

import '../core/utils/constants/text_strings.dart';
import '../core/utils/theme/theme.dart';

class TShoeSpotterApp extends StatelessWidget {
  // const ShoeSpotterApp({super.key}); // default constructor

  //--------- return one instance in all my application ----------
  // name constructor
  const TShoeSpotterApp._internal();
  // Singleton or single instance
  static const TShoeSpotterApp _instance = TShoeSpotterApp._internal();
  // factory
  factory TShoeSpotterApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(
          body: Center(
        child: Text(AppTexts.appName),
      )),
    );
  }
}

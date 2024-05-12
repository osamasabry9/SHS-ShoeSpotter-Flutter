import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/routing/app_router.dart';
import '../core/routing/routes.dart';
import '../core/utils/constants/text_strings.dart';
import '../core/utils/theme/theme.dart';
import 'general_bindings.dart';

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
    return GetMaterialApp(
      title: AppTexts.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.loaderScreen,
    );
  }
}

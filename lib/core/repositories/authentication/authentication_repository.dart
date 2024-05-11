import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app/di.dart';
import '../../routing/routes.dart';
import '../../utils/constants/text_strings.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables

  // called from main.dart on app launch
  @override
  void onReady() {
    screenRedirect();
    FlutterNativeSplash.remove();
  }
  // Function to show relevant screen

  screenRedirect() async {
    getIt<GetStorage>().read(AppTexts.PREFS_KEY_ONBOARDING_SCREEN_VIEWED) !=
            true
        ? Get.offAllNamed(Routes.onBoardingScreen)
        : Get.offAllNamed(Routes.loginScreen);
  }

  // checks if user is logged in or not
}

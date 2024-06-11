import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../app/di.dart' as di;
import '../../../features/Personalization/domain/usecases/logout_user_usecase.dart';
import '../../local_storage/storage_utility.dart';
import '../../routing/routes.dart';
import '../../utils/constants/api_constants.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

  // called from main.dart on app launch
  @override
  void onReady() {
    screenRedirect();
    FlutterNativeSplash.remove();
  }
  // Function to show relevant screen

  screenRedirect() async {
    final user = di.getIt<FirebaseAuth>().currentUser;
    if (user != null) {
      if (user.emailVerified) {

        // Initialize User Specific Storage

        await AppLocalStorage.init(user.uid);

        Get.offAllNamed(Routes.mainScreen);
      } else {
        Get.offAllNamed(Routes.emailVerificationScreen, arguments: user.email);
      }
    } else {
      // local storage
      deviceStorage.writeIfNull(AppPrefsKeys.PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);

      deviceStorage.read(AppPrefsKeys.PREFS_KEY_ONBOARDING_SCREEN_VIEWED) !=
              true
          ? Get.offAllNamed(Routes.onBoardingScreen)
          : Get.offAllNamed(Routes.loginScreen);
    }
  }

//

  // Logout user - valid for any authentication.
  Future<void> logoutUser() async {
    await di.getIt<LogoutUserUseCase>().call();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../app/di.dart' as di;
import '../../../features/Personalization/domain/usecases/delete_user_account_usecase.dart';
import '../../../features/Personalization/domain/usecases/logout_user_usecase.dart';
import '../../routing/routes.dart';
import '../../utils/constants/api_constants.dart';

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
    final user = di.getIt<FirebaseAuth>().currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAllNamed(Routes.mainScreen);
      } else {
        Get.offAllNamed(Routes.emailVerificationScreen, arguments: user.email);
      }
    } else {
      di
                  .getIt<GetStorage>()
                  .read(AppPrefsKeys.PREFS_KEY_ONBOARDING_SCREEN_VIEWED) !=
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

  // Delete user account - Remove user Auth and data from firestore.
  Future<void> deleteUserAccount() async {
    await di.getIt<DeleteUserAccountUseCase>().call();
  }
}

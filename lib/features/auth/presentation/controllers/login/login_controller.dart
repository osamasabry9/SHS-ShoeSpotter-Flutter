import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/repositories/authentication/authentication_repository.dart';
import '../../../../../core/utils/constants/api_constants.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/helpers/network_manager.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../../Personalization/presentation/controllers/user/user_controller.dart';
import '../../../domain/usecases/login_user_usecase.dart';
import '../../../domain/usecases/sign_with_google_usecase.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final userController = Get.put(UserController());
  final hidePassword = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final rememberMe = false.obs;

  @override
  void onInit() {
    emailController.text =
        di.getIt<GetStorage>().read(AppPrefsKeys.PREFS_KEY_REMEMBER_ME_EMAIL);
    passwordController.text = di
        .getIt<GetStorage>()
        .read(AppPrefsKeys.PREFS_KEY_REMEMBER_ME_PASSWORD);
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Logging you in...", AppImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      // Save data if remember me is checked
      if (rememberMe.value) {
        di.getIt<GetStorage>().write(AppPrefsKeys.PREFS_KEY_REMEMBER_ME_EMAIL,
            emailController.text.trim());
        di.getIt<GetStorage>().write(
            AppPrefsKeys.PREFS_KEY_REMEMBER_ME_PASSWORD,
            passwordController.text.trim());
      }

      // Register user in the Firebase authentication & Save user data in the firebase and save Authentication user data in the Firebase Firestore
      await di.getIt<LogInUserUseCase>().call(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      // Redirect to home screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      // Show some Generic error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Google Sign In authentication
  Future<void> googleSignIn() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Logging you in...", AppImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      // Google Authentication
      final userCredentials = await di.getIt<SignWithGoogleUseCase>().call();
      // Save user data in the firebase and save Authentication user data in the Firebase Firestore.
      await userController.saveUserData(userCredentials);

      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      // Redirect to home screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      // Show some Generic error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

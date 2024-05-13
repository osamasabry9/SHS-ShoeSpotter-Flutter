import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../domain/usecases/sign_up_user_usecase.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/helpers/network_manager.dart';
import '../../../../../app/di.dart' as di;
import '../../../domain/entities/user_entity.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// Functions Sign Up
  Future<void> signUp() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "We are processing your information...", AppImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }

      // form validation
      if (!signUpFormKey.currentState!.validate()) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      // privacy policy check
      if (!privacyPolicy.value) {
        AppLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must accept the Privacy Policy');
        return;
      }

      // Register user in the Firebase authentication & Save user data in the firebase and save Authentication user data in the Firebase Firestore
      await di.getIt<SignUpUseCase>().call(
          user: UserEntity(
              uid: '',
              email: email.text.trim(),
              firstName: firstName.text.trim(),
              lastName: lastName.text.trim(),
              phoneNumber: phoneNumber.text.trim(),
              username: username.text.trim(),
              profileUrl: ''),
          email: email.text.trim(),
          password: password.text.trim());

      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      // show Success message
      AppLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email to continue');

      // move to verification email screen
      Get.offAllNamed(Routes.emailVerificationScreen,
          arguments: email.text.trim());
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      // Show some Generic error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  @override
  void dispose() {
    email.dispose();
    lastName.dispose();
    firstName.dispose();
    phoneNumber.dispose();
    username.dispose();
    password.dispose();
    privacyPolicy.close();
    // signUpFormKey.();
    super.dispose();
  }
}

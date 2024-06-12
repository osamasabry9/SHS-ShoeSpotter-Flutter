import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/helpers/network_manager.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../domain/usecases/send_password_reset_email_usecase.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance =>
      Get.find<ForgetPasswordController>();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  Future<void> sendResetPasswordEmail() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Processing your request...", AppImages.docerAnimation);

      // check internet connection
      final isConnected =  NetworkManager.instance.isConnected;
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      await di
          .getIt<SendPasswordResetEmailUseCase>()
          .call(email: email.text.trim());
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      // show success message
      AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Check your email for reset password link'.tr);

      // Redirect
      Get.toNamed(Routes.resetPasswordScreen, arguments: email.text.trim());
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      // Show some Generic error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Processing your request...", AppImages.docerAnimation);

      // check internet connection
      final isConnected =  NetworkManager.instance.isConnected;
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      await di.getIt<SendPasswordResetEmailUseCase>().call(email: email.trim());
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      // show success message
      AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Check your email for reset password link'.tr);
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
    super.dispose();
  }
}

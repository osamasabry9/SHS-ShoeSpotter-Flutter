import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/models/success_items_model.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../domain/usecases/send_email_verification_usecase.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

// Send email whenever verify screen is opened amd set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send email verification link
  void sendEmailVerification() async {
    try {
      await di.getIt<SendEmailVerificationUseCase>().call();
      AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Check your email for verification link');
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Timer to automatically redirect on verify email screen
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      di.getIt<FirebaseAuth>().currentUser!.reload();
      final user = di.getIt<FirebaseAuth>().currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        Get.offAllNamed(Routes.successScreen,
            arguments: SuccessItemsModel(
                image: AppImages.successFullRegisterAnimation,
                title: AppTexts.yourAccountCreatedTitle,
                subtitle: AppTexts.yourAccountCreatedSubTitle,
                routeName: Routes.mainScreen));
      }
    });
  }

  // Manually check if email is verified
  void checkEmailVerificationStatus()async {
     final currentUser = di.getIt<FirebaseAuth>().currentUser;
    if (currentUser!.emailVerified && currentUser.email != null) {
       Get.offAllNamed(Routes.successScreen,
            arguments: SuccessItemsModel(
                image: AppImages.successFullRegisterAnimation,
                title: AppTexts.yourAccountCreatedTitle,
                subtitle: AppTexts.yourAccountCreatedSubTitle,
                routeName: Routes.mainScreen));
    }
  }
}

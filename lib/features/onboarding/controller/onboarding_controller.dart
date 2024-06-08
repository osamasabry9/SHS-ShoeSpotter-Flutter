import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app/di.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/constants/api_constants.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  RxInt currentIndex = 0.obs;
  final pageController = PageController();

  @override
  void onInit() {
    getIt<GetStorage>()
        .write(AppPrefsKeys.PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
    super.onInit();
  }

  // Updates the current index
  void updateIndex(int index) => currentIndex.value = index;

  // Jump to the specified dot selected page.
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Updates the current index and jump to the selected page.
  void nextPage() {
    if (currentIndex.value == 2) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      int page = currentIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    Get.offAllNamed(Routes.loginScreen);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/helper_functions.dart';

import '../../widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AppHelperFunctions.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AppAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static void closeLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

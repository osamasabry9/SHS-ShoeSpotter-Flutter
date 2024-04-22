import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/helpers/extensions.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnBoardingNextButtonWidget extends StatelessWidget {
  const OnBoardingNextButtonWidget({
    super.key,
    required this.isLast,
    required this.onboardController,
  });

  final bool isLast;
  final PageController onboardController;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return ElevatedButton(
      onPressed: () {
        if (isLast) {
          context.pushReplacementNamed(
            Routes.loginScreen,
          );
        } else {
          onboardController.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: dark ? AppColors.primary : Colors.black,
      ),
      child: const Icon(
        Iconsax.arrow_right_3,
      ),
    );
  }
}

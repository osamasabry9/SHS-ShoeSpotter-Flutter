import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingNextButtonWidget extends StatelessWidget {
  const OnBoardingNextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return ElevatedButton(
      onPressed: () => OnBoardingController.instance.nextPage(),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? AppColors.primary : Colors.black),
      child: const Icon(Iconsax.arrow_right_3),
    );
  }
}

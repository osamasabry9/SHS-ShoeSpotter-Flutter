import 'package:flutter/material.dart';
import '../../controller/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import 'on_boarding_page_view_items.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    return SmoothPageIndicator(
      onDotClicked: (index) => controller.dotNavigationClick(index),
      controller: controller.pageController,
      effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          expansionFactor: 3,
          dotHeight: 6,
          dotWidth: 6,
          spacing: 6),
      count: OnBoardingPageViewItems.introPages.length,
    );
  }
}

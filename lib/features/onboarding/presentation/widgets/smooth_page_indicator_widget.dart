import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/colors.dart';
import 'package:shoe_spotter/core/utils/helpers/helper_functions.dart';
import 'package:shoe_spotter/features/onboarding/presentation/widgets/on_boarding_page_view_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
    required this.onboardController,
  });

  final PageController onboardController;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return SmoothPageIndicator(
      onDotClicked: (index) {
        onboardController.animateToPage(
          index,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      controller: onboardController,
      effect: ExpandingDotsEffect(
        activeDotColor: dark ? AppColors.light : AppColors.dark,
        expansionFactor: 3,
        dotHeight: 6,
        dotWidth: 6,
        spacing: 6,
      ),
      count: OnBoardingPageViewItems.introPages.length,
    );
  }
}

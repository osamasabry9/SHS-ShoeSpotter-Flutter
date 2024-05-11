import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../controller/onboarding_controller.dart';
import '../widgets/on_boarding_next_button_widget.dart';
import '../widgets/on_boarding_page_view_items.dart';
import '../widgets/on_boarding_skip_widget.dart';
import '../widgets/smooth_page_indicator_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OnBoardingSkipWidget(),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    OnBoardingPageViewItems.introPages[index],
                onPageChanged: (index) => controller.updateIndex(index),
                itemCount: OnBoardingPageViewItems.introPages.length,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SmoothPageIndicatorWidget(),
                Spacer(),
                OnBoardingNextButtonWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

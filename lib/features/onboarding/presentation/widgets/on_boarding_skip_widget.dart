import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingSkipWidget extends StatelessWidget {
  const OnBoardingSkipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(AppTexts.skip , style: TextStyle(color: AppColors.primary),),
      ),
    );
  }
}

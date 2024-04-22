import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/extensions.dart';

class OnBoardingSkipWidget extends StatelessWidget {
  const OnBoardingSkipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          context.pushReplacementNamed(
            Routes.loginScreen,
          );
        },
        child: const Text(AppTexts.skip , style: TextStyle(color: AppColors.primary),),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../features/auth/presentation/controllers/login/login_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class SocialButtonsWidget extends StatelessWidget {
  const SocialButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.borderRadiusCircular,
            ),
          ),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                  image: AssetImage(AppImages.google))),
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(
              AppSizes.borderRadiusCircular,
            ),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                  image: AssetImage(AppImages.facebook))),
        ),
      ],
    );
  }
}

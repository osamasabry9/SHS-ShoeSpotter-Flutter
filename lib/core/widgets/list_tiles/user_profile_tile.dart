import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/Personalization/presentation/controllers/user/user_controller.dart';
import '../../routing/routes.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../custom_shapes/shimmer/app_shimmer_effect.dart';
import '../images/circular_image_widget.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const CircularImageWidget(
          imageUrl: AppImages.user, width: 50, height: 50, padding: 0),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const AppShimmerEffectWidget(width: 80, height: 15);
        } else {
          return Text(controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.white));
        }
      }),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.white)),
      trailing: IconButton(
          onPressed: onPressed ?? () => Get.toNamed(Routes.profileScreen),
          icon: const Icon(Iconsax.edit, color: AppColors.white)),
    );
  }
}

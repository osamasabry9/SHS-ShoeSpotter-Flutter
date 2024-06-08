import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/app_shimmer_effect.dart';
import '../../../../../../core/widgets/images/circular_image_widget.dart';
import '../../../controllers/user/user_controller.dart';

class ProfilePictureSectionWidget extends StatelessWidget {
  const ProfilePictureSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Obx(() {
              final networkImage = controller.user.value.profileUrl;
              final image =
                  networkImage.isNotEmpty ? networkImage : AppImages.user;
              return controller.imageUploading.value ? const AppShimmerEffectWidget(width: 80, height: 80, radius: 80) :  CircularImageWidget(
                  imageUrl: image,
                  width: 80,
                  height: 80,
                  isNetworkImage: networkImage.isNotEmpty);
            }),
            TextButton(
                onPressed: () => controller.uploadUserProfilePicture(),
                child: const Text("Change Profile Picture",
                    style: TextStyle(color: AppColors.primary))),
          ],
        ));
  }
}

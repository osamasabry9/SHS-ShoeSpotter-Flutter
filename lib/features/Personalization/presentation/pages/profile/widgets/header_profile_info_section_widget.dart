import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../controllers/user/user_controller.dart';
import 'profile_menu_widget.dart';

class HeaderProfileInfoSectionWidget extends StatelessWidget {
  const HeaderProfileInfoSectionWidget({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Column(
      children: [
        const SectionHeading(
            title: "Profile Information", showActionButton: false),
        const SizedBox(height: AppSizes.spaceBtwItems),
        ProfileMenuWidget(
            title: "Name",
            value: controller.user.value.fullName,
            onPressed: () => Get.offNamed(Routes.changeNameScreen)),
        ProfileMenuWidget(
            title: "Username",
            value: controller.user.value.username,
            onPressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems),
        const Divider(),
        const SizedBox(height: AppSizes.spaceBtwItems),
      ],
    );
  }
}

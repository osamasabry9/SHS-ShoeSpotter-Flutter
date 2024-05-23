import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/user/user_controller.dart';
import 'profile_menu_widget.dart';

class HeaderPersonalInfoSectionWidget extends StatelessWidget {
  const HeaderPersonalInfoSectionWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Column(
      children: [
        ProfileMenuWidget(
            title: "User ID",
            value: controller.user.value.uid,
            icon: Iconsax.copy,
            onPressed: () {}),
        ProfileMenuWidget(
            title: "E-mail",
            value: controller.user.value.email,
            onPressed: () {}),
        ProfileMenuWidget(
            title: "Phone Number",
            value: controller.user.value.phoneNumber,
            onPressed: () {}),
        ProfileMenuWidget(title: "Gender", value: "Male", onPressed: () {}),
        ProfileMenuWidget(
            title: "Date of Birth", value: "11 Nov 1999", onPressed: () {}),
      ],
    );
  }
}

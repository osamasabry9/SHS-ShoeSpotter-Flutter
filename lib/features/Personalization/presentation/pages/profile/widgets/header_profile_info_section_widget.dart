import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import 'profile_menu_widget.dart';

class HeaderProfileInfoSectionWidget extends StatelessWidget {
  const HeaderProfileInfoSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeading(
            title: "Profile Information", showActionButton: false),
        const SizedBox(height: AppSizes.spaceBtwItems),
        ProfileMenuWidget(
            title: "Name", value: "Osama Sabry", onPressed: () {}),
        ProfileMenuWidget(
            title: "Username", value: "OsamaSabry9", onPressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems),
        const Divider(),
        const SizedBox(height: AppSizes.spaceBtwItems),
      ],
    );
  }
}

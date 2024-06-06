import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SectionHeading(title: "App Settings", showActionButton: false),
      const SizedBox(height: AppSizes.spaceBtwItems),
      SettingsMenuTile(
        icon: Iconsax.document_upload,
        title: "Load Data",
        subTitle: "Upload data to your cloud firebase",
        onTap: () {}
      ),
      SettingsMenuTile(
        icon: Iconsax.location,
        title: "Geolocation",
        subTitle: "Set recommendations based on your location",
        trailing: Switch(
            value: true, onChanged: (value) {}, activeColor: AppColors.primary),
      ),
      SettingsMenuTile(
        icon: Iconsax.security_user,
        title: "Safe Mode",
        subTitle: "Search result is safe for all ages",
        trailing: Switch(
            value: false,
            onChanged: (value) {},
            activeColor: AppColors.primary),
      ),
      SettingsMenuTile(
        icon: Iconsax.image,
        title: "HD Image Quality",
        subTitle: "Set image quality to to be seen",
        trailing: Switch(
            value: false,
            onChanged: (value) {},
            activeColor: AppColors.primary),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoe_spotter/core/utils/constants/colors.dart';
import 'package:shoe_spotter/core/utils/constants/image_strings.dart';
import 'package:shoe_spotter/core/widgets/images/circular_image_widget.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImageWidget(
          imageUrl: AppImages.user,
          width: 50,
          height: 50,
          padding: 0),
      title: Text("Coding with Osama",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.white)),
      subtitle: Text("Osama.sabry324@gmail.com",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.white)),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.edit, color: AppColors.white)),
    );
  }
}

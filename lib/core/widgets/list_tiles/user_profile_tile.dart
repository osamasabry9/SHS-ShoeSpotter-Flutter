import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../images/circular_image_widget.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.name, required this.email, required this.onPressed,
  });
  final String name;
  final String email;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImageWidget(
          imageUrl: AppImages.user, width: 50, height: 50, padding: 0),
      title: Text(name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.white)),
      subtitle: Text(email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: AppColors.white)),
    );
  }
}

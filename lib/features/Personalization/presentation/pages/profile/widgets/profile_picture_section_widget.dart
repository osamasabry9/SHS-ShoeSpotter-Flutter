import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/widgets/images/circular_image_widget.dart';

class ProfilePictureSectionWidget extends StatelessWidget {
  const ProfilePictureSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const CircularImageWidget(
                imageUrl: AppImages.user, width: 80, height: 80),
            TextButton(
                onPressed: () {},
                child: const Text("Change Profile Picture",
                    style: TextStyle(color: AppColors.primary))),
          ],
        ));
  }
}

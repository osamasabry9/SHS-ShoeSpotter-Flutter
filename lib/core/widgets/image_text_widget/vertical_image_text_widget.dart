import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../images/circular_image_widget.dart';

class VerticalImageTextWidget extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  const VerticalImageTextWidget({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // category icon
            CircularImageWidget(
              imageUrl: image,
              fit: BoxFit.fitWidth,
              padding: AppSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overLayerColor: dark ? AppColors.light : AppColors.dark,
            ),
            // category name
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}

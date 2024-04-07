import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

import '../../../utils/helpers/helper_functions.dart';


class CustomSearchContainer extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool showBackground, showBoarder;
  const CustomSearchContainer({
    super.key,
    required this.hintText,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBoarder = true,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Container(
          width: AppDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? AppColors.dark
                    : AppColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBoarder ? Border.all(color: AppColors.grey) : null,
          ),
          child: Row(children: [
            Icon(icon, color: AppColors.darkerGrey),
            const SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(hintText, style: Theme.of(context).textTheme.bodySmall),
          ])),
    );
  }
}

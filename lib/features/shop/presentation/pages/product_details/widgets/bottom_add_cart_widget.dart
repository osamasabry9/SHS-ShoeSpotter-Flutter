import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/widgets/icons/circular_icon_widget.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';

class BottomAddCartWidget extends StatelessWidget {
  const BottomAddCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.defaultSpace,
          vertical: AppSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? AppColors.darkerGrey : AppColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.cardRadiusLg),
            topRight: Radius.circular(AppSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Add to cart button
          Row(
            children: [
              const CircularIconWidget(
                  icon: Iconsax.minus,
                  backgroundColor: AppColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: AppColors.white),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AppSizes.spaceBtwItems),
              const CircularIconWidget(
                  icon: Iconsax.add,
                  backgroundColor: AppColors.black,
                  width: 40,
                  height: 40,
                  color: AppColors.white),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: AppColors.black,
                side: const BorderSide(color: AppColors.black),
              ),
              child: const Text("Add to cart")),
        ],
      ),
    );
  }
}

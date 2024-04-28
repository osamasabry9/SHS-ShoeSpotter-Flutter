import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoe_spotter/core/utils/constants/colors.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';
import 'package:shoe_spotter/core/utils/helpers/helper_functions.dart';
import 'package:shoe_spotter/core/widgets/icons/circular_icon_widget.dart';

class ProductQuantityWithAddRemoveButtonWidget extends StatelessWidget {
  const ProductQuantityWithAddRemoveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIconWidget(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AppSizes.md,
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
          color: dark ? AppColors.white : AppColors.black,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AppSizes.spaceBtwItems),
        const CircularIconWidget(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AppSizes.md,
          backgroundColor: AppColors.primary,
          color: AppColors.white,
        ),
      ],
    );
  }
}

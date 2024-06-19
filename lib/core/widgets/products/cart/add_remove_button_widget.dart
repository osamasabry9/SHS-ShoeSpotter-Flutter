import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon_widget.dart';

class ProductQuantityWithAddRemoveButtonWidget extends StatelessWidget {
  const ProductQuantityWithAddRemoveButtonWidget({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;

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
          onPressed: remove,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AppSizes.spaceBtwItems),
        CircularIconWidget(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AppSizes.md,
          backgroundColor: AppColors.primary,
          color: AppColors.white,
          onPressed: add,
        ),
      ],
    );
  }
}

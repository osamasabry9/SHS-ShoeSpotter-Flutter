import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CartMenuIcon extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback onPressed;
  const CartMenuIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return IconButton(
      onPressed: onPressed,
      icon: Badge(
        label: Text(
          '2',
          style: Theme.of(context).textTheme.labelLarge!.apply(
              color: dark ? AppColors.black : AppColors.white,
              fontSizeFactor: 0.8),
        ),
        backgroundColor: dark ? AppColors.white : AppColors.black,
        child: Icon(
          Iconsax.shopping_bag,
          color: iconColor ?? (dark ? AppColors.white : AppColors.black),
        ),
      ),
    );
  }
}

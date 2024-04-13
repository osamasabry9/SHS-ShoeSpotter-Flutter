import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';

class CartMenuIcon extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;
  const CartMenuIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

 

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Badge(
        label: Text(
          '2',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: AppColors.white, fontSizeFactor: 0.8),
        ),
        backgroundColor: AppColors.black,
        child:  Icon(
          Iconsax.shopping_bag,
          color: iconColor,
        ),
      ),
    );
  }
}

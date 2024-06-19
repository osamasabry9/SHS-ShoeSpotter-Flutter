import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/presentation/controllers/cart/cart_controller.dart';
import '../../../routing/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CartMenuIcon extends StatelessWidget {
  final Color? iconColor;

  const CartMenuIcon({
    super.key,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return IconButton(
      onPressed: () => Get.toNamed(Routes.cartScreen),
      icon: Badge(
        label: Obx(
          () => Text(
            cartController.onOfCartItems.value.toString(),
            style: Theme.of(context).textTheme.labelLarge!.apply(
                color: dark ? AppColors.black : AppColors.white,
                fontSizeFactor: 0.8),
          ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/icons/circular_icon_widget.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../controllers/cart/cart_controller.dart';

class BottomAddCartWidget extends StatelessWidget {
  const BottomAddCartWidget({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
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
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Add to cart button
            Row(
              children: [
                CircularIconWidget(
                  icon: Iconsax.minus,
                  backgroundColor: AppColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value > 1
                          ? cartController.productQuantityInCart.value -= 1
                          : null,
                ),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Text(cartController.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: AppSizes.spaceBtwItems),
                CircularIconWidget(
                  icon: Iconsax.add,
                  backgroundColor: AppColors.black,
                  width: 40,
                  height: 40,
                  color: AppColors.white,
                  onPressed: () =>
                      cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),

            ElevatedButton(
                onPressed: cartController.productQuantityInCart.value < 1
                    ? null
                    : () => cartController.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(AppSizes.md),
                  backgroundColor: AppColors.black,
                  side: const BorderSide(color: AppColors.black),
                ),
                child: const Text("Add to cart")),
          ],
        ),
      ),
    );
  }
}

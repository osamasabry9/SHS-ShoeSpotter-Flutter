import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../texts/product_price_text_widget.dart';

class PriceAndAddToCartWidget extends StatelessWidget {
  const PriceAndAddToCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Price
        const Flexible(
            child: ProductPriceTextWidget(price: "305.5")),
    
        /// Add to cart button
        Container(
          decoration: const BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.cardRadiusMd),
              bottomRight: Radius.circular(
                  AppSizes.productImageRadius),
            ),
          ),
          child: const SizedBox(
            width: AppSizes.iconLg * 1.2,
            height: AppSizes.iconLg * 1.2,
            child: Center(
              child:
                  Icon(Iconsax.add, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}

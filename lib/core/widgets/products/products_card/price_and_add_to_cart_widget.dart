import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/domain/entities/product_entity.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../texts/product_price_text_widget.dart';

class PriceAndAddToCartWidget extends StatelessWidget {
  const PriceAndAddToCartWidget({
    super.key,
    required this.price,
    required this.product,
  });

  final String price;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Price
        Flexible(
            child: Column(
          children: [
            if ( product.productType == ProductType.single.toString() && product.salePrice > 0)
             Text(product.price.toString(), style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough)),
            ProductPriceTextWidget(price: price),
          ],
        )),

        /// Add to cart button
        Container(
          decoration: const BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.cardRadiusMd),
              bottomRight: Radius.circular(AppSizes.productImageRadius),
            ),
          ),
          child: const SizedBox(
            width: AppSizes.iconLg * 1.2,
            height: AppSizes.iconLg * 1.2,
            child: Center(
              child: Icon(Iconsax.add, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}

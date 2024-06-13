import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/enums.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../../../core/widgets/images/circular_image_widget.dart';
import '../../../../../../core/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../../../core/widgets/texts/product_price_text_widget.dart';
import '../../../../../../core/widgets/texts/product_title_text_widget.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../controllers/product/product_controller.dart';

class ProductMetaDataWidget extends StatelessWidget {
  const ProductMetaDataWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final salePercentage = productController.getDiscountPercentage(
        product.price, product.salePrice);

    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price & sale price
        Row(children: [
          /// sale Tag
          if (salePercentage != null)
            RoundedContainerWidget(
              borderRadius: AppSizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text(salePercentage,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AppColors.black)),
            ),
          const SizedBox(width: AppSizes.spaceBtwItems),

          /// price
          if (product.productType == ProductType.single.toString() &&
              product.salePrice > 0)
            Text("\$${product.price}",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
          if (product.productType == ProductType.single.toString() &&
              product.salePrice > 0)
            const SizedBox(width: AppSizes.spaceBtwItems),
          ProductPriceTextWidget(
              price: productController.getVariationPrice(product),
              isLarge: true),
        ]),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Title
        ProductTitleTextWidget(title: product.title),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleTextWidget(title: "Status"),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(productController.checkProductStackStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImageWidget(
                imageUrl: product.brand != null ? product.brand!.image : '',
                width: 32,
                height: 32,
                overLayerColor: dark ? AppColors.white : AppColors.black),
            BrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/enums.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../../../core/widgets/images/circular_image_widget.dart';
import '../../../../../../core/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../../../core/widgets/texts/product_price_text_widget.dart';
import '../../../../../../core/widgets/texts/product_title_text_widget.dart';

class ProductMetaDataWidget extends StatelessWidget {
  const ProductMetaDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price & sale price
        Row(children: [
          /// sale Tag
          RoundedContainerWidget(
            borderRadius: AppSizes.sm,
            backgroundColor: AppColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm, vertical: AppSizes.xs),
            child: Text('25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: AppColors.black)),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),

          /// price
          Text("\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough)),
          const SizedBox(width: AppSizes.spaceBtwItems),
          const ProductPriceTextWidget(price: "175", isLarge: true),
        ]),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitleTextWidget(title: "Green Nike sport shirt"),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitleTextWidget(title: "Status"),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImageWidget(
                imageUrl: AppImages.shoeIcon,
                width: 32,
                height: 32,
                overLayerColor: dark ? AppColors.white : AppColors.black),
            const BrandTitleWithVerifiedIcon(
                title: "Nike", brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}

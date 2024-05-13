import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/images/rounded_image_widget.dart';
import '../../../widgets/texts/brand_title_with_verified_icon.dart';
import '../../../widgets/texts/product_title_text_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Row(children: [
      /// image
      RoundedImageWidget(
        imageUrl: AppImages.productImage1,
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(AppSizes.sm),
        backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
      ),
      const SizedBox(width: AppSizes.spaceBtwItems),

      /// Title and price and size
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BrandTitleWithVerifiedIcon(title: "Nike"),
            const Flexible(
              child: ProductTitleTextWidget(
                  title: "Green Sport Shoe", maxLines: 1),
            ),

            /// Attributes
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "Color: ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Green  ",
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: "Size: ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "UK 06 ",
                    style: Theme.of(context).textTheme.bodyLarge),
              ]),
            ),
          ],
        ),
      ),
    ]);
  }
}

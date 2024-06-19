import 'package:flutter/material.dart';

import '../../../../features/shop/domain/entities/cart_item_entity.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../widgets/images/rounded_image_widget.dart';
import '../../../widgets/texts/brand_title_with_verified_icon.dart';
import '../../../widgets/texts/product_title_text_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Row(children: [
      /// image
      RoundedImageWidget(
        imageUrl: cartItem.image ?? '',
        width: 60,
        height: 60,
        isNetworkImage: true,
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
            BrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
            Flexible(
              child: ProductTitleTextWidget(title: cartItem.title, maxLines: 1),
            ),

            /// Attributes
            Text.rich(
              TextSpan(
                children: (cartItem.selectedVariation ?? {})
                    .entries
                    .map((e) => TextSpan(children: [
                          TextSpan(
                              text: '${e.key}: ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: '${e.value} ',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ]))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routing/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/extensions.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container_widget.dart';
import '../../icons/circular_icon_widget.dart';
import '../../images/rounded_image_widget.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text_widget.dart';
import 'price_and_add_to_cart_widget.dart';

class ProductCardHorizontalWidget extends StatelessWidget {
  const ProductCardHorizontalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
        onTap: () => context.pushNamed(Routes.productDetailsScreen),
        child: Container(
          width: 310,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: dark ? AppColors.darkerGrey : AppColors.softGrey,
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          ),
          child: Row(
            children: [
              /// Thumbnail, wishlist icon, Discount tag
              RoundedContainerWidget(
                height: 120,
                padding: const EdgeInsets.all(AppSizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.white,
                child: Stack(
                  children: [
                    /// Thumbnail Image
                    const SizedBox(
                      width: 120,
                      height: 120,
                      child: RoundedImageWidget(
                        imageUrl: AppImages.productImage1,
                        applyImageRadius: true,
                      ),
                    ),

                    /// Discount tag
                    Positioned(
                      top: 12,
                      child: RoundedContainerWidget(
                        borderRadius: AppSizes.sm,
                        backgroundColor: AppColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.sm, vertical: AppSizes.xs),
                        child: Text('10%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: AppColors.black)),
                      ),
                    ),

                    /// Wishlist icon
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIconWidget(
                          icon: Iconsax.heart5, color: Colors.red),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                width: 172,
                child: Padding(
                  padding: EdgeInsets.only(left: AppSizes.sm, top: AppSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleTextWidget(
                              title: 'Green Nike Air Shoes', smallSize: true),
                          SizedBox(height: AppSizes.spaceBtwItems / 2),
                          BrandTitleWithVerifiedIcon(title: " Nike"),
                        ],
                      ),
                      Spacer(),

                      /// Price & Add to cart
                      PriceAndAddToCartWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

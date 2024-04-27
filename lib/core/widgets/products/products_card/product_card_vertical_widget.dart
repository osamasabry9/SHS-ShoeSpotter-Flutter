import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routing/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/extensions.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container_widget.dart';
import '../../icons/circular_icon_widget.dart';
import '../../images/rounded_image_widget.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text_widget.dart';
import '../../texts/product_title_text_widget.dart';

class ProductCardVerticalWidget extends StatelessWidget {
  const ProductCardVerticalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.productDetailsScreen),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AppShadowStyle.verticalProductShadow],
          color: dark ? AppColors.darkerGrey : AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        ),
        child: Column(
          children: [
            /// Thumbnail, wishlist icon, Discount tag
            RoundedContainerWidget(
              height: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  const RoundedImageWidget(
                    imageUrl: AppImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// Discount tag
                  Positioned(
                    top: 12,
                    child: RoundedContainerWidget(
                      borderRadius: AppSizes.sm,
                      backgroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        '10%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: AppColors.black,
                            ),
                      ),
                    ),
                  ),

                  /// Wishlist icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIconWidget(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: AppSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleTextWidget(
                      title: 'Green Nike Air Shoes',
                      smallSize: true,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems / 2),
                    BrandTitleWithVerifiedIcon(
                      title: " Nike",
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
/// Price & Add to cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: AppSizes.sm),
                  child: ProductPriceTextWidget(price: "35.5"),
                ),

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
                      child: Icon(
                        Iconsax.add,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/domain/entities/product_entity.dart';
import '../../../../features/shop/presentation/controllers/product/product_controller.dart';
import '../../../routing/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container_widget.dart';
import '../../icons/circular_icon_widget.dart';
import '../../images/rounded_image_widget.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text_widget.dart';
import 'price_and_add_to_cart_widget.dart';

class ProductCardVerticalWidget extends StatelessWidget {
  const ProductCardVerticalWidget({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    final salePercentage = productController.getDiscountPercentage(
        product.price, product.salePrice);
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.productDetailsScreen, arguments: product),
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
              width: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  Center(
                    child: RoundedImageWidget(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
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
                      child: Text(
                        salePercentage,
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
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleTextWidget(
                        title: product.title, smallSize: true),
                    const SizedBox(height: AppSizes.spaceBtwItems / 2),
                    BrandTitleWithVerifiedIcon(title: product.brand!.name),
                  ],
                ),
              ),
            ),
            const Spacer(),

            /// Price & Add to cart
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: PriceAndAddToCartWidget(
                price: productController.getVariationPrice(product),
                product: product,
              ),
            )
          ],
        ),
      ),
    );
  }
}

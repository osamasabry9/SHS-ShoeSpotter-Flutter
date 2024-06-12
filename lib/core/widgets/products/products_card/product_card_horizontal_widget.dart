import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../features/shop/domain/entities/product_entity.dart';
import '../../../../features/shop/presentation/controllers/product/product_controller.dart';
import '../../../routing/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container_widget.dart';
import '../../images/rounded_image_widget.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text_widget.dart';
import '../favorite_icon/favorite_icon.dart';
import 'price_and_add_to_cart_widget.dart';

class ProductCardHorizontalWidget extends StatelessWidget {
  const ProductCardHorizontalWidget({
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
        onTap: () =>
            Get.toNamed(Routes.productDetailsScreen, arguments: product),
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
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: RoundedImageWidget(
                          imageUrl: product.thumbnail,
                          isNetworkImage: true,
                          applyImageRadius: true),
                    ),

                    /// Discount tag
                    if (salePercentage != null)
                      Positioned(
                        top: 12,
                        child: RoundedContainerWidget(
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
                      ),

                    /// Wishlist icon
                    Positioned(
                        top: 0,
                        right: 0,
                        child: FavoriteIconWidget(productId: product.id)),
                  ],
                ),
              ),

              SizedBox(
                width: 172,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppSizes.sm, top: AppSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleTextWidget(
                              title: product.title, smallSize: true),
                          const SizedBox(height: AppSizes.spaceBtwItems / 2),
                          BrandTitleWithVerifiedIcon(
                            title: product.brand!.name,
                          ),
                        ],
                      ),
                      const Spacer(),

                      /// Price & Add to cart
                      PriceAndAddToCartWidget(
                          price: productController.getVariationPrice(product),
                          product: product),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

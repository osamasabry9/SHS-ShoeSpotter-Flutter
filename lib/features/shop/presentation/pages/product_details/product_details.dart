import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../domain/entities/product_entity.dart';
import 'widgets/bottom_add_cart_widget.dart';
import 'widgets/product_attributes_widget.dart';
import 'widgets/product_checkout_widget.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_images_slider_widget.dart';
import 'widgets/product_meta_data_widget.dart';
import 'widgets/product_reviews_widget.dart';
import 'widgets/rating_and_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddCartWidget(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product images slider
            ProductImagesSliderWidget(product: product),

            /// Product details
            Padding(
                padding: const EdgeInsets.only(
                    right: AppSizes.defaultSpace,
                    left: AppSizes.defaultSpace,
                    bottom: AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Rating and share button
                    const RatingAndShareWidget(),

                    /// Price, title, stock, brand
                    ProductMetaDataWidget(product: product),

                    /// Attributes
                    if (product.productType == ProductType.variable.toString())
                      ProductAttributesWidget(product: product),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// checkout Button
                    const ProductCheckoutWidget(),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// Description
                    ProductDescriptionWidget(product: product),
                    const SizedBox(height: AppSizes.spaceBtwItems),

                    /// Reviews
                    const ProductReviewsWidget(),
                    const SizedBox(height: AppSizes.spaceBtwSections),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

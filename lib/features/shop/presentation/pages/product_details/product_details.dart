import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'widgets/bottom_add_cart_widget.dart';
import 'widgets/product_attributes_widget.dart';
import 'widgets/product_checkout_widget.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_images_slider_widget.dart';
import 'widgets/product_meta_data_widget.dart';
import 'widgets/product_reviews_widget.dart';
import 'widgets/rating_and_share_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      bottomNavigationBar: BottomAddCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product images slider
            ProductImagesSliderWidget(),

            /// Product details
            Padding(
                padding: EdgeInsets.only(
                    right: AppSizes.defaultSpace,
                    left: AppSizes.defaultSpace,
                    bottom: AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Rating and share button
                    RatingAndShareWidget(),

                    /// Price, title, stock, brand
                    ProductMetaDataWidget(),

                    /// Attributes
                    ProductAttributesWidget(),
                    SizedBox(height: AppSizes.spaceBtwSections),

                    /// checkout Button
                    ProductCheckoutWidget(),
                    SizedBox(height: AppSizes.spaceBtwSections),

                    /// Description
                    ProductDescriptionWidget(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    /// Reviews
                    ProductReviewsWidget(),
                    SizedBox(height: AppSizes.spaceBtwSections),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/products/ratings/rating_bar_indicator_widget.dart';
import 'widgets/overall_product_ratings_widget.dart';
import 'widgets/user_review_card_widget.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: Text("Reviews & Ratings"), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Ratings & Reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: AppSizes.spaceBtwItems),

            /// Overall Product Ratings
            const OverallProductRatingsWidget(),
            const RatingBarIndicatorWidget(rating: 4.5),
            Text("12,611", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// User Reviews List
            const UserReviewCardWidget(),
            const UserReviewCardWidget(),
            const UserReviewCardWidget(),
          ],
        ),
      )),
    );
  }
}

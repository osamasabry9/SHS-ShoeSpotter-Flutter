import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shoe_spotter/core/utils/constants/colors.dart';
import 'package:shoe_spotter/core/utils/constants/image_strings.dart';
import 'package:shoe_spotter/core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import 'package:shoe_spotter/core/widgets/products/ratings/rating_bar_indicator_widget.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';

class UserReviewCardWidget extends StatelessWidget {
  const UserReviewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.userProfileImage1)),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),

      /// Review
      Row(children: [
        const RatingBarIndicatorWidget(rating: 4),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text("25 Apr 2024", style: Theme.of(context).textTheme.bodyMedium),
      ]),
      const SizedBox(height: AppSizes.spaceBtwItems),
      const ReadMoreText(
        "The user interface of the app is quite intuitive. The app is easy to use. Great job. I am very satisfied with the app. I will buy it again.",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Less',
        moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
        lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),

      const SizedBox(height: AppSizes.spaceBtwItems),

      /// Company review
      RoundedContainerWidget(
        backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("T's Store",
                    style: Theme.of(context).textTheme.titleMedium),
                Text("27 Apr 2024",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            const ReadMoreText(
              "The user interface of the app is quite intuitive. The app is easy to use. Great job. I am very satisfied with the app. I will buy it again.",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Less',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
          ]),
        ),
      ),
      const SizedBox(height: AppSizes.spaceBtwSections),
    ]);
  }
}

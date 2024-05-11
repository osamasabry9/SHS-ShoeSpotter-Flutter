import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/chips/choice_chip_widget.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../../../core/widgets/texts/product_price_text_widget.dart';
import '../../../../../../core/widgets/texts/product_title_text_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

class ProductAttributesWidget extends StatelessWidget {
  const ProductAttributesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attributes pricing and description
        RoundedContainerWidget(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              /// title and price and stock status
              Row(
                children: [
                  const SectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price
                      Row(
                        children: [
                          const ProductTitleTextWidget(
                              title: 'Price', smallSize: true),
                          const SizedBox(width: AppSizes.spaceBtwItems),

                          /// Actual price
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          /// Sale price
                          const SizedBox(width: AppSizes.spaceBtwItems),
                          const ProductPriceTextWidget(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitleTextWidget(
                              title: 'Stock', smallSize: true),
                          const SizedBox(width: AppSizes.spaceBtwItems),

                          /// In Stock
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const ProductTitleTextWidget(
                  title:
                      "This is the description of the product and it can go up to max 4 line.",
                  smallSize: true,
                  maxLines: 4),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "Colors", showActionButton: false),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChipWidget(
                    selected: true, text: "Green", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "Blue", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "Yellow", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "Red", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "Purple", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "Orange", onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: "Sizes", showActionButton: false),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChipWidget(
                    selected: true, text: "EU 39", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "EU 40", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "EU 41", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "EU 42", onSelected: (value) {}),
                ChoiceChipWidget(
                    selected: false, text: "EU 43", onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/chips/choice_chip_widget.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../../../core/widgets/texts/product_price_text_widget.dart';
import '../../../../../../core/widgets/texts/product_title_text_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../controllers/product/variation_controller.dart';

class ProductAttributesWidget extends StatelessWidget {
  const ProductAttributesWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final variationController = Get.put(VariationController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          /// Selected Attributes pricing and description
          /// Display selected attributes
          if (variationController.selectedVariation.value.id.isNotEmpty)
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
                              if (variationController
                                      .selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  "\$${variationController.selectedVariation.value.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),

                              /// Sale price
                              const SizedBox(width: AppSizes.spaceBtwItems),
                              ProductPriceTextWidget(
                                  price:
                                      variationController.getVariationPrice()),
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
                                variationController.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Variation Description
                  ProductTitleTextWidget(
                      title: variationController
                              .selectedVariation.value.description ??
                          '',
                      smallSize: true,
                      maxLines: 4),
                ],
              ),
            ),
          const SizedBox(height: AppSizes.spaceBtwItems),

          /// Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        const SizedBox(height: AppSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = variationController
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = variationController
                                    .getAttributeAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                return ChoiceChipWidget(
                                    selected: isSelected,
                                    text: attributeValue,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              variationController
                                                  .onAttributeSelected(
                                                      product,
                                                      attribute.name ?? '',
                                                      attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        ),
                      ],
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
  
  
}

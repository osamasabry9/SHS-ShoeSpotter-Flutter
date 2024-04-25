import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/brands/brand_show_case_widget.dart';
import '../../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

class CategoryTabWidget extends StatelessWidget {
  const CategoryTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              const BrandShowCaseWidget(images: [
                AppImages.productImage1,
                AppImages.productImage2,
                AppImages.productImage3,
              ]),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              // products
              SectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              GridLayoutWidget(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return const ProductCardVerticalWidget();
                  }),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ],
    );
  }
}

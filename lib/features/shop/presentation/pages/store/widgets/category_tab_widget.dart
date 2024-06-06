import 'package:flutter/material.dart';
import '../../../../data/models/product_model.dart';

import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/brands/brand_show_case_widget.dart';
import '../../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../../data/models/category_model.dart';
import '../../../../domain/entities/brand_entity.dart';

class CategoryTabWidget extends StatelessWidget {
  const CategoryTabWidget({
    super.key,
    required this.categoryModel,
    required this.brand,
  });
  final CategoryModel categoryModel;
  final BrandEntity brand;

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
              BrandShowCaseWidget(images: const [
                AppImages.promoBanner1,
                AppImages.promoBanner1,
                AppImages.promoBanner1
              ], brand: brand),
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
                    return  ProductCardVerticalWidget(product: ProductModel.empty(), );
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/vertical_product_shimmer_widget.dart';
import '../../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../../data/models/category_model.dart';
import '../../../controllers/category_controller.dart';
import '../../all_products/all_products_screen.dart';
import 'category_brand_widget.dart';

class CategoryTabWidget extends StatelessWidget {
  const CategoryTabWidget({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              CategoryBrandWidget(category: category),
              const SizedBox(height: AppSizes.spaceBtwItems),
              // products
              FutureBuilder(
                  future: categoryController.getProductsForCategory(
                      categoryId: category.id),
                  builder: (context, snapshot) {
                    // helper functions to check the state of the snapshot

                    const loader = VerticalProductShimmerWidget(itemCount: 4);
                    final widget =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        SectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(() => AllProductsScreen(
                              title: category.name,
                              futureMethod:
                                  categoryController.getProductsForCategory(
                                      categoryId: category.id, limit: -1))),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        // show products here in grid view layout
                        GridLayoutWidget(
                            itemCount: products.length,
                            itemBuilder: (_, index) {
                              return ProductCardVerticalWidget(
                                  product: products[index]);
                            }),
                      ],
                    );
                  }),

              const SizedBox(height: AppSizes.spaceBtwSections)
            ],
          ),
        ),
      ],
    );
  }
}

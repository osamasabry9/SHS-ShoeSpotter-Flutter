import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../../core/widgets/brands/brand_show_case_widget.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/boxes_shimmer_widget.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/list_tile_shimmer_widget.dart';
import '../../../../domain/entities/category_entity.dart';
import '../../../controllers/brand_controller.dart';

class CategoryBrandWidget extends StatelessWidget {
  const CategoryBrandWidget({
    super.key,
    required this.category,
  });

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return FutureBuilder(
        future: brandController.getBrandsByCategoryId(category.id),
        builder: (context, snapshot) {
          // Check the state of the futureBuilder snapshot
          const loader = Column(
            children: [
              ListTileShimmerWidget(),
              SizedBox(height: AppSizes.spaceBtwItems),
              BoxesShimmerWidget(),
              SizedBox(height: AppSizes.spaceBtwItems),
            ],
          );
          final widget = AppCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);

          // Return appropriate widget based on the snapshot state
          if (widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
            itemCount: brands.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: brandController.getProductsByBrandId(
                      brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    // Check the state of the futureBuilder snapshot
                    final widget =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    // Products found
                    final products = snapshot.data!;
                    return BrandShowCaseWidget(
                        brand: brand,
                        images: products.map((e) => e.thumbnail).toList());
                  });
            },
          );
        });
  }
}

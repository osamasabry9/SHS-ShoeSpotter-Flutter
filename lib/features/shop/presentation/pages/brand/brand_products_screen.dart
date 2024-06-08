import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/custom_shapes/shimmer/vertical_product_shimmer_widget.dart';
import '../../../../../core/widgets/products/sortable/sortable_products.dart';
import '../../../domain/entities/brand_entity.dart';
import '../../controllers/brand_controller.dart';
import '../store/widgets/brand_card_widget.dart';

class BrandProductsScreen extends StatelessWidget {
  final BrandEntity brand;
  const BrandProductsScreen({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: CustomAppBar(showBackArrow: true, title: Text(brand.name)),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Heading
              BrandCardWidget(brand: brand, showBorder: true),
              const SizedBox(height: AppSizes.spaceBtwSections),
              FutureBuilder(
                  future: brandController.getProductsByBrandId(brand.id),
                  builder: (context, snapshot) {
                    // Check the state of the futureBuilder snapshot
                    const loader = VerticalProductShimmerWidget(itemCount: 6);
                    final widget =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);

                    // Return appropriate widget based on the snapshot state
                    if (widget != null) return widget;

                    // Products found
                    final products = snapshot.data!;

                    return SortableProducts(products: products);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

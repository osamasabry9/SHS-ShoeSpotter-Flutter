import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/custom_shapes/shimmer/vertical_product_shimmer_widget.dart';
import '../../../../../core/widgets/products/sortable/sortable_products.dart';
import '../../../domain/entities/product_entity.dart';
import '../../controllers/product/all_products_controller.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key,
      this.title = "Popular Products",
      this.query,
      this.futureMethod});
  final String title;
  final Query? query;

  final Future<List<ProductEntity>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(AllProductsController());
    return Scaffold(
      appBar: CustomAppBar(showBackArrow: true, title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: FutureBuilder(
              future:
                  futureMethod ?? productController.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // Check the state of the futureBuilder snapshot
                const loader = VerticalProductShimmerWidget(itemCount: 6);
                final widget = AppCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                // Return appropriate widget based on the snapshot state
                if (widget != null) return widget;

                // Products found
                final products = snapshot.data!;
                return SortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}

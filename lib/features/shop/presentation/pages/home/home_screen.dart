import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/utils/constants/api_constants.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../../core/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../core/widgets/custom_shapes/shimmer/vertical_product_shimmer_widget.dart';
import '../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products_screen.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_categories_section.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // app bar
                  const HomeAppBar(),
                  // search bar
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  CustomSearchContainer(
                      hintText: "Search in Store", onTap: () {}),
                  // categories
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const HomeCategoriesSection(),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Carousel slider
                  const PromoSlider(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// Heading
                  SectionHeading(
                      title: "Popular Products",
                      onPressed: () => Get.to(() => AllProductsScreen(
                            title: "Popular Products",
                            query: di
                                .getIt<FirebaseFirestore>()
                                .collection(FirebaseConst.PRODUCTS_COLLECTION)
                                .where('isFeatured', isEqualTo: true)
                                .limit(6),
                            futureMethod:
                                productController.fetchAllFeaturedProducts(),
                          ))),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  // Popular Products
                  Obx(() {
                    if (productController.isLoading.value) {
                      return const VerticalProductShimmerWidget(
                        itemCount: 4,
                      );
                    }
                    if (productController.featuredProducts.isEmpty) {
                      return Center(
                        child: Text("No Data found!",
                            style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }

                    return GridLayoutWidget(
                        itemCount: productController.featuredProducts.length,
                        itemBuilder: (context, index) =>
                            ProductCardVerticalWidget(
                                product:
                                    productController.featuredProducts[index]));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_spotter/features/shop/presentation/pages/all_products/all_products_screen.dart';

import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/custom_shapes/shimmer/horizontal_product_shimmer_widget.dart';
import '../../../../../core/widgets/images/rounded_image_widget.dart';
import '../../../../../core/widgets/products/products_card/product_card_horizontal_widget.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../../domain/entities/category_entity.dart';
import '../../controllers/category_controller.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return Scaffold(
      appBar: CustomAppBar(showBackArrow: true, title: Text(category.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImageWidget(
                  imageUrl: AppImages.promoBanner3,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Sub Categories
              FutureBuilder(
                  future: categoryController.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = HorizontalProductShimmerWidget();
                    final widget =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: categoryController.getProductsForCategory(
                                categoryId: category.id),
                            builder: (context, snapshot) {
                              final widget =
                                  AppCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);

                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  SectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(
                                      () => AllProductsScreen(
                                          title: subCategory.name,
                                          futureMethod: categoryController
                                              .getProductsForCategory(
                                                  categoryId: subCategory.id,
                                                  limit: -1)),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: AppSizes.spaceBtwSections),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                              width: AppSizes.spaceBtwItems),
                                      itemBuilder: (_, index) =>
                                          ProductCardHorizontalWidget(
                                              product: products[index]),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: AppSizes.spaceBtwSections),
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/brand_shimmer_widget.dart';
import '../../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../controllers/brand_controller.dart';
import 'brand_card_widget.dart';

class BrandSectionWidget extends StatelessWidget {
  const BrandSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // search bar
          const SizedBox(height: AppSizes.spaceBtwItems),
          const CustomSearchContainer(
            hintText: "Search in Store",
            showBoarder: true,
            showBackground: false,
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),

          /// Featured Brands
          SectionHeading(
              title: "Featured Brands",
              onPressed: () => Get.toNamed(Routes.allBrandsScreen)),

          const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

          Obx(() {
            if (brandController.isLoading.value) {
              return const BrandShimmerWidget();
            }
            if (brandController.featuredBrands.isEmpty) {
              return const Center(
                child: Text("No Data found!",
                    style: TextStyle(color: AppColors.white)),
              );
            }
            return GridLayoutWidget(
                itemCount: brandController.featuredBrands.length,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  return BrandCardWidget(
                      brand: brandController.featuredBrands[index],
                      showBorder: true,
                      onTap: () => Get.toNamed(Routes.brandProductsScreen,
                          arguments: brandController.featuredBrands[index]));
                });
          }),
        ],
      ),
    );
  }
}

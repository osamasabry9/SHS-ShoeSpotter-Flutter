import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/app_shimmer_effect.dart';
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
    final brandController = BrandController.instance;
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
              return GridLayoutWidget(
                  itemCount: 4,
                  mainAxisExtent: 80,
                  itemBuilder: (_, __) => const AppShimmerEffectWidget(
                      width: 80, height: 80, radius: 10));
            }
            if (brandController.allBrands.isEmpty) {
              return const Center(
                child: Text("No Data found!",
                    style: TextStyle(color: AppColors.white)),
              );
            }
            return GridLayoutWidget(
                itemCount: 4,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  return BrandCardWidget(
                      brand: brandController.allBrands[index],
                      showBorder: true,
                      onTap: () => Get.toNamed(Routes.brandProductsScreen));
                });
          }),
        ],
      ),
    );
  }
}

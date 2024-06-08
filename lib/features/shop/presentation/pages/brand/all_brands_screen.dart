import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/custom_shapes/shimmer/brand_shimmer_widget.dart';
import '../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../controllers/brand_controller.dart';
import '../store/widgets/brand_card_widget.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppBar(showBackArrow: true, title: Text("Brand")),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Heading
              const SectionHeading(title: "Brands", showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Obx(() {
                if (brandController.isLoading.value) {
                  return const BrandShimmerWidget();
                }
                if (brandController.allBrands.isEmpty) {
                  return const Center(
                    child: Text("No Data found!",
                        style: TextStyle(color: AppColors.white)),
                  );
                }
                return GridLayoutWidget(
                  itemBuilder: (_, index) => BrandCardWidget(
                      brand: brandController.allBrands[index],
                      showBorder: true,
                      onTap: () => Get.toNamed(Routes.brandProductsScreen,
                          arguments: brandController.allBrands[index])),
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                );
              }),

              /// Brands
            ],
          ),
        ),
      ),
    );
  }
}

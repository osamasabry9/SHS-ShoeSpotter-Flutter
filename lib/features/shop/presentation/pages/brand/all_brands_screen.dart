import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/extensions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../controllers/brand_controller.dart';
import '../store/widgets/brand_card_widget.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
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

              /// Brands
              GridLayoutWidget(
                itemBuilder: (_, index) => BrandCardWidget(
                    brand: brandController.allBrands[index],
                    showBorder: true,
                    onTap: () => context.pushNamed(Routes.brandProductsScreen , arguments: brandController.allBrands[index])),
                itemCount: brandController.allBrands.length,
                mainAxisExtent: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}

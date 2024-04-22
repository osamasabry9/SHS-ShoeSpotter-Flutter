import 'package:flutter/material.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../core/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';
import '../../../../core/widgets/texts/section_heading.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_categories_section.dart';
import '../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  CustomSearchContainer(
                    hintText: "Search in Store",
                    onTap: () {},
                  ),
                  // categories
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const HomeCategoriesSection(),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Carousel slider
                  const PromoSlider(
                    banners: [
                      AppImages.promoBanner1,
                      AppImages.promoBanner2,
                      AppImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  /// Heading
                  SectionHeading(
                    title: "Popular Products",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  // Popular Products
                  GridLayoutWidget(
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          const ProductCardVerticalWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

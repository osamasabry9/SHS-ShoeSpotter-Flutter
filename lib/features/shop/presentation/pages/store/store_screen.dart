import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/extensions.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/appBar/custom_tab_bar.dart';
import '../../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../core/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../controllers/category_controller.dart';
import 'widgets/brand_card_widget.dart';
import 'widgets/category_tab_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return DefaultTabController(
      length: categoryController.featuredCategories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartMenuIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) => [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: AppHelperFunctions.isDarkMode(context)
                        ? AppColors.black
                        : AppColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
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
                            onPressed: () =>
                                context.pushNamed(Routes.allBrandsScreen),
                          ),
                          const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
                          GridLayoutWidget(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return BrandCardWidget(
                                    showBorder: true,
                                    onTap: () => context
                                        .pushNamed(Routes.brandProductsScreen));
                              }),
                        ],
                      ),
                    ),
                    bottom: CustomTabBar(
                        tabs: categoryController.featuredCategories
                            .map((category) => Tab(child: Text(category.name)))
                            .toList()),
                  ),
                ],
            body: TabBarView(
                children: categoryController.featuredCategories
                    .map((category) =>
                        CategoryTabWidget(categoryModel: category))
                    .toList())),
      ),
    );
  }
}

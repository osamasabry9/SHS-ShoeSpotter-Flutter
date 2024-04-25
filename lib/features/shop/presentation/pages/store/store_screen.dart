import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/appBar/custom_tab_bar.dart';
import '../../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../core/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import 'widgets/brand_card_widget.dart';
import 'widgets/category_tab_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                            onPressed: () {},
                          ),
                          const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
                          GridLayoutWidget(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const BrandCardWidget();
                              }),
                        ],
                      ),
                    ),
                    bottom: const CustomTabBar(tabs: [
                      Tab(
                        child: Text(
                          "Sports",
                        ),
                      ),
                      Tab(
                          child: Text(
                        "Furniture",
                      )),
                      Tab(
                          child: Text(
                        "Electronics",
                      )),
                      Tab(
                          child: Text(
                        "Clothes",
                      )),
                      Tab(
                          child: Text(
                        "Cosmetics",
                      ))
                    ]),
                  ),
                ],
            body: TabBarView(
              children: [for (int i = 0; i < 5; i++) const CategoryTabWidget()],
            )),
      ),
    );
  }
}

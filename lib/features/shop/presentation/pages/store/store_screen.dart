import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/brand_model.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/appBar/custom_tab_bar.dart';
import '../../../../../core/widgets/products/cart/cart_menu_icon.dart';
import '../../controllers/brand_controller.dart';
import '../../controllers/category_controller.dart';
import 'widgets/brand_section_widget.dart';
import 'widgets/category_tab_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final brandController = Get.put(BrandController());
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
                    flexibleSpace: const BrandSectionWidget(),
                    bottom: CustomTabBar(
                        tabs: categoryController.featuredCategories
                            .map((category) => Tab(child: Text(category.name)))
                            .toList()),
                  ),
                ],
            body: TabBarView(
                children: categoryController.featuredCategories
                    .map((category) => CategoryTabWidget(
                          categoryModel: category,
                          brand: brandController.allBrands.firstWhere(
                              (brand) => brand.name == category.name,
                              orElse: () => BrandModel.empty()),
                        ))
                    .toList())),
      ),
    );
  }
}

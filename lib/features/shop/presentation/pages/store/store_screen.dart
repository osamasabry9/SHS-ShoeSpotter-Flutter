import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/appBar/custom_tab_bar.dart';
import '../../../../../core/widgets/products/cart/cart_menu_icon.dart';
import '../../controllers/category_controller.dart';
import 'widgets/brand_section_widget.dart';
import 'widgets/category_tab_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categoryController.length,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartMenuIcon(onPressed: () => Get.toNamed(Routes.cartScreen)),
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
                        tabs: categoryController
                            .map((category) => Tab(child: Text(category.name)))
                            .toList()),
                  ),
                ],
            body: TabBarView(
                children: categoryController
                    .map((category) => CategoryTabWidget(category: category))
                    .toList())),
      ),
    );
  }
}

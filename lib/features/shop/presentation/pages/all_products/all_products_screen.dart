import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/products/sortable/sortable_products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:
          CustomAppBar(showBackArrow: true, title: Text("Popular Products")),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: SortableProducts(),
        ),
      ),
    );
  }
}

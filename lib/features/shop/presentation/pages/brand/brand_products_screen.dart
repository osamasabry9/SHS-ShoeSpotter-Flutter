import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/products/sortable/sortable_products.dart';
import '../store/widgets/brand_card_widget.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(showBackArrow: true, title: Text("Nike")),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Heading
              BrandCardWidget(showBorder: true),
              SizedBox(height: AppSizes.spaceBtwSections),
              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

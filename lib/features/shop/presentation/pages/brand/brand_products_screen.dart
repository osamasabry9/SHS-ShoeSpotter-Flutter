import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/products/sortable/sortable_products.dart';
import '../../../domain/entities/brand_entity.dart';
import '../store/widgets/brand_card_widget.dart';

class BrandProductsScreen extends StatelessWidget {
  final BrandEntity brand;
  const BrandProductsScreen({super.key , required this.brand});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(showBackArrow: true, title: Text("Nike")),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Heading
              BrandCardWidget(brand: brand, showBorder: true),
              const SizedBox(height: AppSizes.spaceBtwSections),
              const SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

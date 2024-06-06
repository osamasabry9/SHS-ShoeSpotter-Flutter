import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/domain/entities/product_entity.dart';
import '../../../../features/shop/presentation/controllers/product/all_products_controller.dart';
import '../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout_widget.dart';
import '../products_card/product_card_vertical_widget.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final allProductsController = Get.put(AllProductsController());
    allProductsController.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'Highest Price',
            'Lowest Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          value: allProductsController.selectedSortOption.value,
          onChanged: (value) {
            allProductsController.sortProduct(value!);
          },
        ),

        const SizedBox(height: AppSizes.spaceBtwSections),
        Obx(
          () => GridLayoutWidget(
              itemCount: allProductsController.products.length,
              itemBuilder: (_, index) => ProductCardVerticalWidget(
                    product: allProductsController.products[index],
                  )),
        )
      ],
    );
  }
}

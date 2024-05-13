import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout_widget.dart';
import '../products_card/product_card_vertical_widget.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
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
          onChanged: (value) {},
        ),
    
        const SizedBox(height: AppSizes.spaceBtwSections),
        GridLayoutWidget(
            itemCount: 6,
            itemBuilder: (_, __) => const ProductCardVerticalWidget())
      ],
    );
  }
}

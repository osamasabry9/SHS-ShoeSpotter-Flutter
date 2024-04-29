import 'package:flutter/material.dart';

import '../../../../../../core/widgets/products/cart/add_remove_button_widget.dart';
import '../../../../../../core/widgets/texts/product_price_text_widget.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/products/cart/cart_item_widget.dart';

class ListItemCartWidget extends StatelessWidget {
  const ListItemCartWidget({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartItemWidget(),
        if (showAddRemoveButtons)
          const SizedBox(height: AppSizes.spaceBtwItems),
        if (showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra space
                  SizedBox(width: 70),

                  /// add Remove Buttons
                  ProductQuantityWithAddRemoveButtonWidget(),
                ],
              ),

              /// Product total price
              ProductPriceTextWidget(price: '256'),
            ],
          )
      ],
    );
  }
}

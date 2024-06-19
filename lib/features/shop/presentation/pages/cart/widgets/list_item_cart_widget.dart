import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/products/cart/add_remove_button_widget.dart';
import '../../../../../../core/widgets/products/cart/cart_item_widget.dart';
import '../../../../../../core/widgets/texts/product_price_text_widget.dart';
import '../../../../data/models/cart_item_model.dart';
import '../../../controllers/cart/cart_controller.dart';

class ListItemCartWidget extends StatelessWidget {
  const ListItemCartWidget({
    super.key,
    this.showAddRemoveButtons = true,
    required this.cartItem,
  });
  final bool showAddRemoveButtons;
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Column(
      children: [
        CartItemWidget(cartItem: cartItem),
        if (showAddRemoveButtons)
          const SizedBox(height: AppSizes.spaceBtwItems),
        if (showAddRemoveButtons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra space
                  const SizedBox(width: 70),

                  /// add Remove Buttons
                  ProductQuantityWithAddRemoveButtonWidget(
                    quantity: cartItem.quantity,
                    add: () => cartController.addOneToCart(cartItem),
                    remove: () => cartController.removeOneFromCart(cartItem),
                  ),
                ],
              ),

              /// Product total price
              ProductPriceTextWidget(
                  price:
                      (cartItem.price * cartItem.quantity).toStringAsFixed(1)),
            ],
          )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../controllers/cart/cart_controller.dart';
import 'list_item_cart_widget.dart';

class ListViewCartWidget extends StatelessWidget {
  const ListViewCartWidget({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartController.cartItems.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppSizes.spaceBtwSections),
          itemBuilder: (_, index) => Obx(() {
            final item = cartController.cartItems[index];
            return ListItemCartWidget(
              cartItem: item,
              showAddRemoveButtons: showAddRemoveButtons,
            );
          }),
        ),
      ),
    );
  }
}

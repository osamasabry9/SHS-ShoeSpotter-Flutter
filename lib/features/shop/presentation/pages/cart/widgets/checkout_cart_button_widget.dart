import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../controllers/cart/cart_controller.dart';

class CheckoutCartButtonWidget extends StatelessWidget {
  const CheckoutCartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: ElevatedButton(
          onPressed: () => Get.toNamed(Routes.checkoutScreen),
          child: Obx(
              () => Text("Checkout \$${cartController.totalCartPrice.value}"))),
    );
  }
}

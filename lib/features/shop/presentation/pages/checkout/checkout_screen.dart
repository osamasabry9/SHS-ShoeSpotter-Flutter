import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/pricing_calculator.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/products/cart/coupon_code_widget.dart';
import '../../controllers/cart/cart_controller.dart';
import '../../controllers/checkout/order_controller.dart';
import '../cart/widgets/list_view_cart_widget.dart';
import 'widgets/billing_section_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount =
        AppPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Order Review",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              ListViewCartWidget(showAddRemoveButtons: false),
              SizedBox(height: AppSizes.spaceBtwSections),

              /// Coupon TextField
              CouponCodeWidget(),
              SizedBox(height: AppSizes.spaceBtwSections),

              /// Billing section
              BillingSectionWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => AppLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Please add items to your cart'),
            child: Text("Checkout \$$totalAmount")),
      ),
    );
  }
}

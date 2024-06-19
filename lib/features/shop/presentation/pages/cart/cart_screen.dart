import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/loaders/animation_loader.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../controllers/cart/cart_controller.dart';
import 'widgets/checkout_cart_button_widget.dart';
import 'widgets/list_view_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
          showBackArrow: true,
          title:
              Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          // Nothing found widget
          final emptyWidget = AppAnimationLoaderWidget(
              text: 'Whoops! Cart is empty',
              animation: AppImages.cartAnimation,
              showAction: true,
              actionText: 'Let\'s add some',
              onActionTap: () => Get.offNamed(Routes.mainScreen));

          if (cartController.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(child: ListViewCartWidget());
          }
        },
      ),
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? null
          : const CheckoutCartButtonWidget(),
    );
  }
}

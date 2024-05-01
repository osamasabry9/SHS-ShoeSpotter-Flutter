import 'package:flutter/material.dart';

import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import 'widgets/checkout_cart_button_widget.dart';
import 'widgets/list_view_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const ListViewCartWidget(),
      bottomNavigationBar: const CheckoutCartButtonWidget(),
    );
  }
}

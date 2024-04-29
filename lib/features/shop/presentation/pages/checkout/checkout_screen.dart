import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/extensions.dart';
import '../../../../../core/utils/models/success_items_model.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/products/cart/coupon_code_widget.dart';
import '../cart/widgets/list_view_cart_widget.dart';
import 'widgets/billing_section_widget.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => context.pushNamed(
                  Routes.successScreen,
                  arguments: SuccessItemsModel(
                      image: AppImages.successfulPaymentIcon,
                      title: "Payment Successful!",
                      subtitle: "Your item will be shipped soon!.",
                      routeName: Routes.mainScreen),
                ),
            child: const Text("Checkout \$265.0")),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/extensions.dart';
import '../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../core/widgets/icons/circular_icon_widget.dart';
import '../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIconWidget(
              icon: Iconsax.add,
              onPressed: () => context.pushReplacementNamed(Routes.mainScreen)),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(children: [
                GridLayoutWidget(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return const ProductCardVerticalWidget();
                    })
              ]))),
    );
  }
}

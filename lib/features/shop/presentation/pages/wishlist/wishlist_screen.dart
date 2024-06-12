import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoe_spotter/core/widgets/loaders/animation_loader.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/custom_shapes/shimmer/vertical_product_shimmer_widget.dart';
import '../../../../../core/widgets/icons/circular_icon_widget.dart';
import '../../../../../core/widgets/layouts/grid_layout_widget.dart';
import '../../../../../core/widgets/products/products_card/product_card_vertical_widget.dart';
import '../../controllers/product/favorite_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = FavoriteController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIconWidget(
              icon: Iconsax.add,
              onPressed: () => Get.offNamed(Routes.mainScreen))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Obx(
                () => FutureBuilder(
                    future: favoriteController.getFavoriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = AppAnimationLoaderWidget(
                          text: 'Whoops! Wishlist is empty',
                          animation: AppImages.pencilAnimation,
                          showAction: true,
                          actionText: 'Let\'s add some',
                          onActionTap: () => Get.offNamed(Routes.mainScreen));

                      const loader = VerticalProductShimmerWidget(itemCount: 6);
                      final widget =
                          AppCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);

                      if (widget != null) return widget;

                      final products = snapshot.data!;
                      return GridLayoutWidget(
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            return ProductCardVerticalWidget(
                                product: products[index]);
                          });
                    }),
              ))),
    );
  }
}

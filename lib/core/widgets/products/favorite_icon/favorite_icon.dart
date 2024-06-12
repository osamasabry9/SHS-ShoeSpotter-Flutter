import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/presentation/controllers/product/favorite_controller.dart';
import '../../icons/circular_icon_widget.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(FavoriteController());
    return Obx(() {
      return CircularIconWidget(
        icon: favoriteController.isFavorite(productId)
            ? Iconsax.heart5
            : Iconsax.heart,
        color: favoriteController.isFavorite(productId) ? Colors.red : null,
        onPressed: () => favoriteController.toggleFavoriteProduct(productId),
      );
    });
  }
}

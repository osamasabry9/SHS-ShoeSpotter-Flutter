import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../domain/entities/product_entity.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;
  // RxList<String> images = <String>[].obs;

  /// Get all Images from product and variations
  List<String> getAllProductImages(ProductEntity product) {
    // Use set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign Thumbnail image
    selectedProductImage.value = product.thumbnail;

    // Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }
// Get all images from the product variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // Show image popup
  void showEnLargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSizes.defaultSpace * 2,
                          horizontal: AppSizes.defaultSpace),
                      child: CachedNetworkImage(imageUrl: image),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text('Close')),
                      ),
                    )
                  ]),
            ));
  }
}

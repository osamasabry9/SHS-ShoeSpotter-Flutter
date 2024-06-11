import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../../core/widgets/custom_shapes/curved/curved_edge_widget.dart';
import '../../../../../../core/widgets/images/rounded_image_widget.dart';
import '../../../../../../core/widgets/products/favorite_icon/favorite_icon.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../controllers/product/images_controller.dart';
import '../../../controllers/product/variation_controller.dart';

class ProductImagesSliderWidget extends StatelessWidget {
  const ProductImagesSliderWidget({
    super.key,
    required this.product,
  });
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    final imagesController = Get.put(ImagesController());
    final images = imagesController.getAllProductImages(product);

    return CurvedEdgeWidget(
      child: Container(
          color: dark ? AppColors.darkerGrey : AppColors.light,
          child: Stack(children: [
            /// Main large image
            SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.all(AppSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = imagesController.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => imagesController.showEnLargedImage(image),
                      child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: AppColors.primary)),
                    );
                  })),
                )),

            /// Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          imagesController.selectedProductImage.value ==
                              images[index];
                      return RoundedImageWidget(
                          onPressed: () => imagesController
                              .selectedProductImage.value = images[index],
                          imageUrl: images[index],
                          width: 80,
                          backgroundColor:
                              dark ? AppColors.dark : AppColors.light,
                          border: Border.all(
                              color: imageSelected
                                  ? AppColors.primary
                                  : Colors.transparent),
                          padding: const EdgeInsets.all(AppSizes.sm),
                          isNetworkImage: true);
                    },
                  ),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSizes.spaceBtwItems),
                ),
              ),
            ),

            CustomAppBar(
              showBackArrow: false,
              leadingIcon: Iconsax.arrow_left,
              leadingOnPressed: () {
                Get.back();
                VariationController.instance.resetSelectedAttributes();
              },
              actions: [FavoriteIconWidget(productId: product.id)],
            ),
          ])),
    );
  }
}

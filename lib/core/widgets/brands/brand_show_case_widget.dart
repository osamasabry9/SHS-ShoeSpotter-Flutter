import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_spotter/core/widgets/custom_shapes/shimmer/app_shimmer_effect.dart';

import '../../../features/shop/domain/entities/brand_entity.dart';
import '../../../features/shop/presentation/pages/store/widgets/brand_card_widget.dart';
import '../../routing/routes.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container_widget.dart';

class BrandShowCaseWidget extends StatelessWidget {
  const BrandShowCaseWidget({
    super.key,
    required this.images,
    required this.brand,
  });
  final List<String> images;
  final BrandEntity brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.brandProductsScreen, arguments: brand),
      child: RoundedContainerWidget(
        showBorder: true,
        borderColor: AppColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(AppSizes.sm),
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            // brand with product count
            BrandCardWidget(brand: brand),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // brand top 3 products
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(context, image))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Expanded brandTopProductImageWidget(BuildContext context, String image) {
    return Expanded(
      child: RoundedContainerWidget(
        height: 100,
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.light,
        padding: const EdgeInsets.all(AppSizes.md),
        margin: const EdgeInsets.only(right: AppSizes.sm),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (_, __, downloadProgress) =>
              const AppShimmerEffectWidget(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

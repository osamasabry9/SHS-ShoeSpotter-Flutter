import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/custom_shapes/containers/circular_container_widget.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/app_shimmer_effect.dart';
import '../../../../../../core/widgets/images/rounded_image_widget.dart';
import '../../../controllers/banner_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Obx(() {
      if (bannerController.isLoading.value) {
        return const AppShimmerEffectWidget(
            width: double.infinity, height: 190, radius: 10);
      }
      if (bannerController.allBanners.isEmpty) {
        return const Center(
          child:
              Text("No Data found!", style: TextStyle(color: AppColors.white)),
        );
      }
      return Column(
        children: [
          CarouselSlider(
            items: bannerController.allBanners
                .map((banner) => RoundedImageWidget(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    bannerController.updatePageIndicator(index)),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < bannerController.allBanners.length; i++)
                    CircularContainerWidget(
                      width: 20,
                      height: 4,
                      backgroundColor:
                          bannerController.carousalCurrentIndex.value == i
                              ? AppColors.primary
                              : AppColors.grey,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

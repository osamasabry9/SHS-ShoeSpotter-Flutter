import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/custom_shapes/containers/circular_container_widget.dart';
import '../../../../../../core/widgets/images/rounded_image_widget.dart';
import '../../../controllers/home_controller.dart';

class PromoSlider extends StatelessWidget {
  final List<String> banners;
  const PromoSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((e) => RoundedImageWidget(imageUrl: e))
              .toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  homeController.updatePageIndicator(index)),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < banners.length; i++)
              CircularContainerWidget(
                width: 20,
                height: 4,
                backgroundColor: homeController.carousalCurrentIndex.value == i
                    ? AppColors.primary
                    : AppColors.grey,
                margin: const EdgeInsets.only(right: 10),
              ),
          ],
        )
      ],
    );
  }
}

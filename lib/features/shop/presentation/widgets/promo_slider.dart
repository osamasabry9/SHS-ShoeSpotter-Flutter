import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/colors.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';
import 'package:shoe_spotter/core/widgets/custom_shapes/containers/circular_container_widget.dart';
import 'package:shoe_spotter/core/widgets/images/rounded_image_widget.dart';

class PromoSlider extends StatefulWidget {
  final List<String> banners;
  const PromoSlider({
    super.key,
    required this.banners,
  });

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  int carousalCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.banners
              .map((e) => RoundedImageWidget(imageUrl: e))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => setState(() {
              carousalCurrentIndex = index;
            }),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < widget.banners.length; i++)
              CircularContainerWidget(
                width: 20,
                height: 4,
                backgroundColor: carousalCurrentIndex == i
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

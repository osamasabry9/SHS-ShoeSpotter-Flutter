import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../custom_shapes/shimmer/app_shimmer_effect.dart';

class CircularImageWidget extends StatelessWidget {
  final double height, width, padding;
  final String imageUrl;
  final Color? backgroundColor;
  final Color? overLayerColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  const CircularImageWidget({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = AppSizes.sm,
    required this.imageUrl,
    this.backgroundColor,
    this.overLayerColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (AppHelperFunctions.isDarkMode(context)
                  ? AppColors.black
                  : AppColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    color: overLayerColor,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const AppShimmerEffectWidget(width: 55, height: 55),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(imageUrl),
                    color: overLayerColor),
          ),
        ));
  }
}

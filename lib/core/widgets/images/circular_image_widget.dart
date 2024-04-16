import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

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
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
          color: overLayerColor ??
              (AppHelperFunctions.isDarkMode(context)
                  ? AppColors.white
                  : AppColors.dark),
        ));
  }
}

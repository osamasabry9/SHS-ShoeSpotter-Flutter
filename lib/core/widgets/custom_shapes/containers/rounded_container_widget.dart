import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/colors.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';

class RoundedContainerWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final bool showBorder;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const RoundedContainerWidget({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.showBorder = false,
    this.backgroundColor = AppColors.white,
    this.borderRadius = AppSizes.cardRadiusLg,
    this.borderColor = AppColors.borderPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}

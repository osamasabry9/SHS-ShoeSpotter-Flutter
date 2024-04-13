import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CircularContainerWidget extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Widget? child;
  final double? padding;
  final EdgeInsets? margin;
  const CircularContainerWidget({
    super.key,
    this.backgroundColor = AppColors.white,
    this.borderRadius = AppSizes.circularContainerRadius,
    this.padding = 0,
    this.margin,
    this.height = AppSizes.circularContainerHeight,
    this.width = AppSizes.circularContainerWidth,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: backgroundColor,
      ),
    );
  }
}

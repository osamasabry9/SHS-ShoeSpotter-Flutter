import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class CircularIconWidget extends StatelessWidget {
  final Color? color, backgroundColor;
  final double? size, width, height;
  final IconData icon;
  final VoidCallback? onPressed;
  const CircularIconWidget({
    super.key,
    this.color,
    this.backgroundColor,
    this.size = AppSizes.lg,
    this.width,
    this.height,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (dark
                ? AppColors.black.withOpacity(0.9)
                : AppColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}

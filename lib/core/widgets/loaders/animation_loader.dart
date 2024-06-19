import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class AppAnimationLoaderWidget extends StatelessWidget {
  const AppAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionTap,
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(animation,
                width: MediaQuery.sizeOf(context).width * 0.8),
            const SizedBox(height: AppSizes.defaultSpace),
            Text(text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSizes.defaultSpace),
            showAction
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: OutlinedButton(
                      onPressed: onActionTap,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.dark),
                      child: Text(actionText!,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: AppColors.light,
                              )),
                    ))
                : const SizedBox(),
          ]),
    );
  }
}

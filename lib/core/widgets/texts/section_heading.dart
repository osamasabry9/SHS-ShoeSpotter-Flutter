import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SectionHeading extends StatelessWidget {
  final String title, buttonTitle;
  final void Function()? onPressed;
  final Color? textColor;
  final bool showActionButton;
  const SectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View All",
    this.onPressed,
    this.textColor,
    this.showActionButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: textColor ?? AppColors.white,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}

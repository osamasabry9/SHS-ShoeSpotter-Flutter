import 'package:flutter/material.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnBoardingPageViewWidget extends StatelessWidget {
  final String image;
  final String headline;
  final String description;
  const OnBoardingPageViewWidget({
    super.key,
    required this.image,
    required this.headline,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          width: AppHelperFunctions.screenWidth(context) * 0.8,
          height: AppHelperFunctions.screenHeight(context) * 0.6,
          image:  AssetImage(image),
        ),
        Text(
          headline,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

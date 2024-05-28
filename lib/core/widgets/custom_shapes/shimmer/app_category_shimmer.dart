import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'app_shimmer_effect.dart';

class AppCategoryShimmerWidget extends StatelessWidget {
  const AppCategoryShimmerWidget({super.key, this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: AppSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              AppShimmerEffectWidget(height: 55, width: 55, radius: 55),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              // title
              AppShimmerEffectWidget(height: 8, width: 55),
            ],
          );
        },
      ),
    );
  }
}

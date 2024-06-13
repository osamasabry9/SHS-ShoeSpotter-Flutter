import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'app_shimmer_effect.dart';

class HorizontalProductShimmerWidget extends StatelessWidget {
  const HorizontalProductShimmerWidget({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      height: 120,
      child: ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: AppSizes.spaceBtwItems),
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // image
                  AppShimmerEffectWidget(height: 120, width: 120),
                  SizedBox(width: AppSizes.spaceBtwItems),

                  // text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      AppShimmerEffectWidget(height: 15, width: 160),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      AppShimmerEffectWidget(height: 15, width: 110),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      AppShimmerEffectWidget(height: 15, width: 80),
                      Spacer(),
                    ],
                  ),
                ],
              )),
    );
  }
}

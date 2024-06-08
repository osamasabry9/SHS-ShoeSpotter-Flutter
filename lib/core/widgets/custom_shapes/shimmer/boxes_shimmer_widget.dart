import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'app_shimmer_effect.dart';

class BoxesShimmerWidget extends StatelessWidget {
  const BoxesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: AppShimmerEffectWidget(height: 110, width: 150)),
            SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: AppShimmerEffectWidget(height: 110, width: 150)),
            SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: AppShimmerEffectWidget(height: 110, width: 150)),
          ],
        )
      ],
    );
  }
}

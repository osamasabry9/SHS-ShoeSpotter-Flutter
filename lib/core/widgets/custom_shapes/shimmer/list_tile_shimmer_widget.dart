import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'app_shimmer_effect.dart';

class ListTileShimmerWidget extends StatelessWidget {
  const ListTileShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            AppShimmerEffectWidget(height: 50, width: 50, radius: 50),
            SizedBox(width: AppSizes.spaceBtwItems),
            Column(
              children: [
                AppShimmerEffectWidget(height: 15, width: 100),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffectWidget(height: 15, width: 80),
              ],
            ),
          ],
        )
      ],
    );
  }
}

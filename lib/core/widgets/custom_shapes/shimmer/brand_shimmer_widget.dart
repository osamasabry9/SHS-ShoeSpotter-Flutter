import 'package:flutter/material.dart';

import '../../layouts/grid_layout_widget.dart';
import 'app_shimmer_effect.dart';

class BrandShimmerWidget extends StatelessWidget {
  const BrandShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridLayoutWidget(
        itemCount: 4,
        mainAxisExtent: 80,
        itemBuilder: (_, __) => const AppShimmerEffectWidget(
            width: 80, height: 80, radius: 10));
  }
}

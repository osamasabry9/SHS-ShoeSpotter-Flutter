import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';
import 'package:shoe_spotter/core/widgets/custom_shapes/shimmer/app_shimmer_effect.dart';
import 'package:shoe_spotter/core/widgets/layouts/grid_layout_widget.dart';

class VerticalProductShimmerWidget extends StatelessWidget {
  const VerticalProductShimmerWidget({
    super.key,
    required this.itemCount,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayoutWidget(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              AppShimmerEffectWidget(
                height: 180,
                width: 180,
              ),
               SizedBox(height: AppSizes.spaceBtwItems),

               // text
              AppShimmerEffectWidget(
                height: 15,
                width: 180,
                
              ),
               SizedBox(height: AppSizes.spaceBtwItems/2),
              AppShimmerEffectWidget(
                height: 15,
                width: 110,
     
              ),
            ],
          ),
        )
        
        );
  }
}

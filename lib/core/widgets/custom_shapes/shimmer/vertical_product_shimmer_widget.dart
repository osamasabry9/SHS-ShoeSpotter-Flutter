import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import 'app_shimmer_effect.dart';
import '../../layouts/grid_layout_widget.dart';

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

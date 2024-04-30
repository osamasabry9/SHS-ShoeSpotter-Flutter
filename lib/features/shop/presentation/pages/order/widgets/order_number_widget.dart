import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/sizes.dart';

class OrderNumberWidget extends StatelessWidget {
  const OrderNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          /// 1 - Icon
          const Icon(Iconsax.tag),
          const SizedBox(width: AppSizes.spaceBtwItems / 2),
    
          /// 2 - status and date
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order",
                    style: Theme.of(context).textTheme.labelMedium),
                Text("[#256f2]",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

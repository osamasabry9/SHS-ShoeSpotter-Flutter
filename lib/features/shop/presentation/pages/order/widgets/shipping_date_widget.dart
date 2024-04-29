import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/utils/constants/sizes.dart';

class ShippingDateWidget extends StatelessWidget {
  const ShippingDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          /// 1 - Icon
          const Icon(Iconsax.calendar),
          const SizedBox(width: AppSizes.spaceBtwItems / 2),
    
          /// 2 - status and date
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shipping Date",
                    style: Theme.of(context).textTheme.labelMedium),
                Text("29 Apr 2024",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

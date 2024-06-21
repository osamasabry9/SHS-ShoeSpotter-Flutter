import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../data/models/order_model.dart';

class OrderNumberWidget extends StatelessWidget {
  const OrderNumberWidget({
    super.key,
    required this.order,
  });
  final OrderModel order;

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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium),
                Text(order.id,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

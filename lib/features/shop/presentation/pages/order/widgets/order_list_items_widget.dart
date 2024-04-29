import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import 'order_item_widget.dart';

class OrderListItemsWidget extends StatelessWidget {
  const OrderListItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppSizes.spaceBtwItems),
      itemBuilder: (_, index) => const OrderItemWidget(),
    );
  }
}

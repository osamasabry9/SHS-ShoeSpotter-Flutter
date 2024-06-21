import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../data/models/order_model.dart';
import 'order_number_widget.dart';
import 'processing_section_widget.dart';
import 'shipping_date_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.order,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return RoundedContainerWidget(
      showBorder: true,
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      padding: const EdgeInsets.all(AppSizes.md),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Row 1
          ProcessingSectionWidget(order: order),
          const SizedBox(height: AppSizes.spaceBtwItems),

          /// Row 2
          Row(
            children: [
              OrderNumberWidget(order:order),
              ShippingDateWidget(order: order),
            ],
          ),
        ],
      ),
    );
  }
}

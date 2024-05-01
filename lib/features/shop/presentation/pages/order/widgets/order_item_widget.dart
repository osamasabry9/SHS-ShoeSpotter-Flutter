import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';

import '../../../../../../core/utils/constants/colors.dart';
import 'order_number_widget.dart';
import 'processing_section_widget.dart';
import 'shipping_date_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return RoundedContainerWidget(
      showBorder: true,
      backgroundColor: dark ? AppColors.dark : AppColors.light,
      padding: const EdgeInsets.all(AppSizes.md),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Row 1
          ProcessingSectionWidget(),
          SizedBox(height: AppSizes.spaceBtwItems),

          /// Row 2
          Row(
            children: [
              OrderNumberWidget(),
              ShippingDateWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import 'billing_address_section_widget.dart';
import 'billing_amount_section_widget.dart';
import 'billing_payment_section_widget.dart';


class BillingSectionWidget extends StatelessWidget {
  const BillingSectionWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return RoundedContainerWidget(
      showBorder: true,
      backgroundColor: dark ? AppColors.black : AppColors.white,
      padding: const EdgeInsets.all(AppSizes.md),
      child: const Column(
        children: [
          /// pricing
          BillingAmountSectionWidget(),
          SizedBox(height: AppSizes.spaceBtwItems),
    
          /// Divider
          Divider(),
          SizedBox(height: AppSizes.spaceBtwItems),
    
          /// payment method
          BillingPaymentSectionWidget(),
    
          SizedBox(height: AppSizes.spaceBtwItems),
    
          /// Address
          BillingAddressSectionWidget(),
        ],
      ),
    );
  }
}

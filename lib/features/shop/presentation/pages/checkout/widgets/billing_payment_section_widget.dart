import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../controllers/checkout/checkout_controller.dart';

class BillingPaymentSectionWidget extends StatelessWidget {
  const BillingPaymentSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
            title: "Payment Method",
            buttonTitle: "Change",
            onPressed: () => checkoutController.selectPaymentMethod(context)),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              RoundedContainerWidget(
                  width: 60,
                  height: 35,
                  backgroundColor: dark ? AppColors.light : AppColors.white,
                  padding: const EdgeInsets.all(AppSizes.sm),
                  child: Image(
                    image: AssetImage(
                        checkoutController.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain,
                  )),
              const SizedBox(width: AppSizes.spaceBtwItems / 2),
              Text(checkoutController.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../data/models/payment_method_model.dart';
import '../../../controllers/checkout/checkout_controller.dart';

class PaymentTileWidget extends StatelessWidget {
  const PaymentTileWidget({super.key, required this.paymentMethod});
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final checkoutController = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        checkoutController.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      title: Text(paymentMethod.name),
      leading: RoundedContainerWidget(
        width: 60,
        height: 40,
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.light
            : AppColors.white,
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}

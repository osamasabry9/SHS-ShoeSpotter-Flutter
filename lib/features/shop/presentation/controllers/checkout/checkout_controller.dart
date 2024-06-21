import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../pages/checkout/widgets/payment_tile_widegt.dart';

import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../data/models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: AppImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppSizes.iconLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                  title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),
              PaymentTileWidget(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: AppImages.paypal)),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              PaymentTileWidget(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: AppImages.creditCard)),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              PaymentTileWidget(
                  paymentMethod:
                      PaymentMethodModel(name: 'Visa', image: AppImages.visa)),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              PaymentTileWidget(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: AppImages.googlePay)),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              PaymentTileWidget(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: AppImages.applePay)),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              PaymentTileWidget(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paytm', image: AppImages.paytm)),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}

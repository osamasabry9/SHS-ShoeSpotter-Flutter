import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../data/models/address_model.dart';
import '../../../controllers/address/address_controller.dart';

class SingleAddressWidget extends StatelessWidget {
  const SingleAddressWidget({
    super.key,
    required this.address,
    required this.onTap,
  });
  final AddressModel address;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = addressController.selectedAddress.value.id;
      final selectedAddress = address.id == selectedAddressId;

      return InkWell(
        onTap: onTap,
        child: RoundedContainerWidget(
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? AppColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? AppColors.darkerGrey
                  : AppColors.grey,
          margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
          padding: const EdgeInsets.all(AppSizes.md),
          child: Stack(children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? AppColors.light
                          : AppColors.dark
                      : null),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSizes.sm / 2),
                Text(
                  address.formattedPhoneNo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSizes.sm / 2),
                Text(address.toString(), softWrap: true),
              ],
            )
          ]),
        ),
      );
    });
  }
}

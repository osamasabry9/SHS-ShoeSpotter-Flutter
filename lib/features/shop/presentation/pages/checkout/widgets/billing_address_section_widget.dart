import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../../../Personalization/presentation/controllers/address/address_controller.dart';

class BillingAddressSectionWidget extends StatelessWidget {
  const BillingAddressSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
            title: "Shipping Address",
            buttonTitle: "Change",
            onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(addressController.selectedAddress.value.name,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.grey, size: 16),
                    const SizedBox(width: AppSizes.spaceBtwItems),
                    Text(
                        addressController
                            .selectedAddress.value.formattedPhoneNo,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Icons.location_history,
                        color: Colors.grey, size: 16),
                    const SizedBox(width: AppSizes.spaceBtwItems),
                    Expanded(
                        child: Text(
                      addressController.selectedAddress.value.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    )),
                  ],
                )
              ])
            : Text('Select an address',
                style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

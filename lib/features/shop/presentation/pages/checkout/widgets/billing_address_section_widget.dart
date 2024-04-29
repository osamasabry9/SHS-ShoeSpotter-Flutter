import 'package:flutter/material.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

import '../../../../../../core/utils/constants/sizes.dart';

class BillingAddressSectionWidget extends StatelessWidget {
  const BillingAddressSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
            title: "Shipping Address", buttonTitle: "Change", onPressed: () {}),
        Text("Coding with OS", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text("+123-456-7890",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
                child: Text(
              "123 Main St, Anton, USA",
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            )),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/extensions.dart';

import '../../../../../../core/routing/routes.dart';

class CheckoutCartButtonWidget extends StatelessWidget {
  const CheckoutCartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: ElevatedButton(
          onPressed: () => context.pushNamed(Routes.checkoutScreen),
          child: const Text("Checkout \$265.0")),
    );
  }
}

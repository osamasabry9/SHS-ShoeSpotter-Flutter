import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';

class CheckoutCartButtonWidget extends StatelessWidget {
  const CheckoutCartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: ElevatedButton(
          onPressed: () {}, child: const Text("Checkout \$265.0")),
    );
  }
}

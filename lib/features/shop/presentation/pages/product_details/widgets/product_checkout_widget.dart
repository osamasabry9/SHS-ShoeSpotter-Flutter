import 'package:flutter/material.dart';

class ProductCheckoutWidget extends StatelessWidget {
  const ProductCheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Checkout"),
      ),
      
    );
  }
}

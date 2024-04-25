import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

class ProductReviewsWidget extends StatelessWidget {
  const ProductReviewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SectionHeading(title: "Reviews (199)", showActionButton: false),
      IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_3))
    ]);
  }
}

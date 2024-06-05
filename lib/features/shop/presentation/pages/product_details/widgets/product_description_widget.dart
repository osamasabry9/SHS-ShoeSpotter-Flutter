import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../../domain/entities/product_entity.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key,
    required this.product
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SectionHeading(
          title: "Description",
          showActionButton: false,
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        ReadMoreText(
          product.description ?? "",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Less',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        const Divider(),
      ],
    );
  }
}

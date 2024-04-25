import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

import '../../../../../../core/utils/constants/sizes.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionHeading(
          title: "Description",
          showActionButton: false,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        ReadMoreText(
          "This is a product description for blue nike sleeve less vest. There more things that can be added but i am only adding this for testing purposes. This is a product description for blue Nike sleeve less vest. There more things that can be added but i am only adding this for testing purposes.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        Divider(),
      ],
    );
  }
}

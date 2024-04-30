import 'package:flutter/material.dart';
import '../../../../../../core/utils/helpers/extensions.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/image_text_widget/vertical_image_text_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: "Popular Categories",
            showActionButton: false,
            textColor: AppColors.white,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          // categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return VerticalImageTextWidget(
                  image: AppImages.shoeIcon,
                  title: "Shoes",
                  onTap: () => context.pushNamed(Routes.subCategoriesScreen),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

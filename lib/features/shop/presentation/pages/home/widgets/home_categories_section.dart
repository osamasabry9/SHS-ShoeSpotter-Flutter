import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/helpers/extensions.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/app_category_shimmer.dart';
import '../../../../../../core/widgets/image_text_widget/vertical_image_text_widget.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';
import '../../../controllers/category_controller.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
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
          Obx(() {
            if (categoryController.isLoading.value) {
              return const AppCategoryShimmerWidget();
            }
            if (categoryController.featuredCategories.isEmpty) {
              return Center(
                child: Text("No Data found!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: AppColors.white)),
              );
            }

            return SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: categoryController.featuredCategories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = categoryController.featuredCategories[index];
                  return VerticalImageTextWidget(
                    image: category.image,
                    title: category.name,
                    onTap: () => context.pushNamed(Routes.subCategoriesScreen),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

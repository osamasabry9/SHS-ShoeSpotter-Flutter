import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widgets/custom_shapes/containers/custom_search_container.dart';
import '../../../../core/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../core/widgets/image_text_widget/vertical_image_text_widget.dart';
import '../../../../core/widgets/texts/section_heading.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // app bar
                  const HomeAppBar(),
                  // search bar
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const CustomSearchContainer(
                    hintText: "Search in Store",
                  ),
                  // categories
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  Padding(
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
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

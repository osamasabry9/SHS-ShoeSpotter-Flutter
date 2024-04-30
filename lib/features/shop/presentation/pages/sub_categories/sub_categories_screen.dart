import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../core/widgets/images/rounded_image_widget.dart';
import '../../../../../core/widgets/products/products_card/product_card_horizontal_widget.dart';
import '../../../../../core/widgets/texts/section_heading.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(showBackArrow: true, title: Text("Sports")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImageWidget(
                  imageUrl: AppImages.promoBanner3,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Sub Categories
              Column(children: [
                SectionHeading(title: "Sports shirts", onPressed: () {}),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppSizes.spaceBtwItems),
                      itemBuilder: (_, index) =>
                          const ProductCardHorizontalWidget()),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}

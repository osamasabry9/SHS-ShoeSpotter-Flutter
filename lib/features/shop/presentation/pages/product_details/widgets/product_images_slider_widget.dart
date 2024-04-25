import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../../core/widgets/custom_shapes/curved/curved_edge_widget.dart';
import '../../../../../../core/widgets/icons/circular_icon_widget.dart';
import '../../../../../../core/widgets/images/rounded_image_widget.dart';

class ProductImagesSliderWidget extends StatelessWidget {
  const ProductImagesSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
          color: dark ? AppColors.darkerGrey : AppColors.light,
          child: Stack(children: [
            /// Main large image
            const SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(AppImages.productImage5))),
                )),

            /// Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => RoundedImageWidget(
                    imageUrl: AppImages.productImage3,
                    width: 80,
                    backgroundColor: dark ? AppColors.dark : AppColors.light,
                    border: Border.all(color: AppColors.primary),
                    padding: const EdgeInsets.all(AppSizes.sm),
                  ),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSizes.spaceBtwItems),
                  itemCount: 4,
                ),
              ),
            ),

            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIconWidget(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ])),
    );
  }
}

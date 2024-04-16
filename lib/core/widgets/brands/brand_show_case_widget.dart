import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container_widget.dart';
import '../../../features/shop/presentation/widgets/brand_card_widget.dart';

class BrandShowCaseWidget extends StatelessWidget {
  const BrandShowCaseWidget({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return RoundedContainerWidget(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(AppSizes.sm),
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Column(
        children: [
          // brand with product count
          const BrandCardWidget(),

          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),

          // brand top 3 products
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(context, image))
                .toList(),
          )
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(BuildContext context, String image) {
    return Expanded(
      child: RoundedContainerWidget(
        height: 100,
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.light,
        padding: const EdgeInsets.all(AppSizes.md),
        margin: const EdgeInsets.only(right: AppSizes.sm),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

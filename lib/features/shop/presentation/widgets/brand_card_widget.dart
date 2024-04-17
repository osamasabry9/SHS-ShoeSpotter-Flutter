import 'package:flutter/material.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../core/widgets/images/circular_image_widget.dart';
import '../../../../core/widgets/texts/brand_title_with_verified_icon.dart';

class BrandCardWidget extends StatelessWidget {
  final bool showBorder;
  const BrandCardWidget({
    super.key,
    this.showBorder = false,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: RoundedContainerWidget(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            const Flexible(
              child: CircularImageWidget(
                imageUrl: AppImages.clothIcon,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
                height: AppSizes.spaceBtwItems / 2),
    
            /// Brand name
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BrandTitleWithVerifiedIcon(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 Products",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                    overflow: TextOverflow.ellipsis,
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

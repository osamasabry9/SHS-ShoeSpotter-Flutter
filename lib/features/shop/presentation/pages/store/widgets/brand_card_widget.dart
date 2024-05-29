import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/enums.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/widgets/custom_shapes/containers/rounded_container_widget.dart';
import '../../../../../../core/widgets/images/circular_image_widget.dart';
import '../../../../../../core/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../domain/entities/brand_entity.dart';

class BrandCardWidget extends StatelessWidget {
  final bool showBorder;
  final void Function()? onTap;
  final BrandEntity brand;
  const BrandCardWidget({
    super.key,
    required this.brand,
    this.showBorder = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainerWidget(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
             Flexible(
              child: CircularImageWidget(
                imageUrl: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            /// Brand name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                   BrandTitleWithVerifiedIcon(
                    title: brand.name ,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "${brand.productsCount} Products",
                    style: Theme.of(context).textTheme.labelMedium,
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

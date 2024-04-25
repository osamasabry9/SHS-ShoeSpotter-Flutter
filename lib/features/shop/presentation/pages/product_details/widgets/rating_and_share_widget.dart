import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/utils/constants/sizes.dart';

class RatingAndShareWidget extends StatelessWidget {
  const RatingAndShareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5,
                color: Colors.amber, size: AppSizes.iconMd),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "4.5",
                  style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(
                text: " (199)",
              )
            ]))
          ],
        ),
    
        /// Share button
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: AppSizes.iconMd,
            ))
      ],
    );
  }
}

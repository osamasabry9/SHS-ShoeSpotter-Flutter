import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/helpers/extensions.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/text_strings.dart';
import '../../../../../../core/widgets/products/cart/cart_menu_icon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppBarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [
        CartMenuIcon(
          iconColor: AppColors.white,
          onPressed: ()=> context.pushNamed(Routes.cartScreen),
        ),
      ],
    );
  }
}

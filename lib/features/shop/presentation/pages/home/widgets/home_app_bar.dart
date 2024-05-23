import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/widgets/custom_shapes/shimmer/app_shimmer_effect.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/text_strings.dart';
import '../../../../../../core/utils/helpers/extensions.dart';
import '../../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../../../../../core/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../Personalization/presentation/controllers/user/user_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const AppShimmerEffectWidget(width: 80, height: 15);
              } else {
                return Text(controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: AppColors.white));
              }
            },
          ),
        ],
      ),
      actions: [
        CartMenuIcon(
          iconColor: AppColors.white,
          onPressed: () => context.pushNamed(Routes.cartScreen),
        ),
      ],
    );
  }
}

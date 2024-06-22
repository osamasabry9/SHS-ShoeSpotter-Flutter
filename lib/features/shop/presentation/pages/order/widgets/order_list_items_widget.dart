import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/constants/image_strings.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../../core/widgets/loaders/animation_loader.dart';
import '../../../controllers/checkout/order_controller.dart';
import 'order_item_widget.dart';

class OrderListItemsWidget extends StatelessWidget {
  const OrderListItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return FutureBuilder(
      future: orderController.fetchUserOrders(),
      builder: (context, snapshot) {
        // Nothing found widget
        final emptyWidget = AppAnimationLoaderWidget(
          animation: AppImages.orderCompleteAnimation,
          text: 'Whoops! No order found',
          showAction: true,
          actionText: 'Let\'s add some',
          onActionTap: () => Get.offNamed(Routes.mainScreen),
        );
        
final response = AppCloudHelperFunctions.checkMultiRecordState(
    snapshot: snapshot , nothingFound: emptyWidget);
    if (response != null) return response;

final orders = snapshot.data!;
        return ListView.separated(
          itemCount: orders.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppSizes.spaceBtwItems),
          itemBuilder: (_, index) => OrderItemWidget(order: orders[index]),
        );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/utils/constants/sizes.dart';
import 'package:shoe_spotter/features/shop/presentation/pages/cart/widgets/list_item_cart_widget.dart';

class ListViewCartWidget extends StatelessWidget {
  const ListViewCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 14,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.spaceBtwSections),
        itemBuilder: (_, index) => const ListItemCartWidget(),
      ),
    );
  }
}

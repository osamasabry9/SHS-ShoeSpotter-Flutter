import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import 'list_item_cart_widget.dart';

class ListViewCartWidget extends StatelessWidget {
  const ListViewCartWidget({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: ListView.separated(
        shrinkWrap: true,
        physics:
            showAddRemoveButtons ? null : const NeverScrollableScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.spaceBtwSections),
        itemBuilder: (_, index) =>
            ListItemCartWidget(showAddRemoveButtons: showAddRemoveButtons),
      ),
    );
  }
}

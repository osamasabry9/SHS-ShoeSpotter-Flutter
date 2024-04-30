import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/extensions.dart';
import '../../../../../../core/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../../core/widgets/texts/section_heading.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SectionHeading(
        title: "Account Settings",
        showActionButton: false,
      ),
      const SizedBox(height: AppSizes.spaceBtwItems),
      SettingsMenuTile(
        icon: Iconsax.safe_home,
        title: "My Addresses",
        subTitle: "Set shopping delivery address",
        onTap: () => context.pushNamed(Routes.addressesScreen),
      ),
      SettingsMenuTile(
        icon: Iconsax.shopping_cart,
        title: "My Cart",
        subTitle: "Add, remove products and move to checkout",
        onTap: () {},
      ),
      SettingsMenuTile(
        icon: Iconsax.bag_tick,
        title: "My Orders",
        subTitle: "In-progress, completed and cancelled orders",
        onTap: () => context.pushNamed(Routes.orderScreen),
      ),
      SettingsMenuTile(
        icon: Iconsax.bank,
        title: "Bank Accounts",
        subTitle: "Withdraw balance to registered bank account",
        onTap: () {},
      ),
      SettingsMenuTile(
        icon: Iconsax.discount_shape,
        title: "My Coupons",
        subTitle: "List of all the discounted coupons",
        onTap: () {},
      ),
      SettingsMenuTile(
        icon: Iconsax.notification,
        title: "Notifications",
        subTitle: "Set any kind of notifications message",
        onTap: () {},
      ),
      SettingsMenuTile(
        icon: Iconsax.security_card,
        title: "Account Privacy",
        subTitle: "Mange data usage and connected accounts",
        onTap: () {},
      ),

      // app settings
      const SizedBox(height: AppSizes.spaceBtwSections),
    ]);
  }
}

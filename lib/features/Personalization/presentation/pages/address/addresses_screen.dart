import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/extensions.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import 'widgets/single_address_widget.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushNamed(Routes.addNewAddressScreen),
          backgroundColor: AppColors.primary,
          child: const Icon(Iconsax.add, color: AppColors.white),
        ),
        appBar: CustomAppBar(
            title: Text("Addresses",
                style: Theme.of(context).textTheme.headlineSmall),
            showBackArrow: true),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                SingleAddressWidget(
                  selectedAddress: false,
                ),
                SingleAddressWidget(
                  selectedAddress: false,
                ),
                SingleAddressWidget(
                  selectedAddress: true,
                ),
                SingleAddressWidget(
                  selectedAddress: false,
                ),
              ],
            ),
          ),
        ));
  }
}

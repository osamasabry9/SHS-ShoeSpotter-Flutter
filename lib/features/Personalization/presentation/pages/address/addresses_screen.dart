import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/utils/helpers/cloud_helper_functions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../controllers/address/address_controller.dart';
import 'widgets/single_address_widget.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.addNewAddressScreen),
          backgroundColor: AppColors.primary,
          child: const Icon(Iconsax.add, color: AppColors.white),
        ),
        appBar: CustomAppBar(
            title: Text("Addresses",
                style: Theme.of(context).textTheme.headlineSmall),
            showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                // use key to trigger refresh
                key: Key(addressController.refreshData.value.toString()),
                  future: addressController.getAllUserAddresses(),
                  builder: (context, snapshot) {
                    final response =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot);
                    if (response != null) return response;
              
                    final addresses = snapshot.data!;
                    return ListView.builder(
                        itemCount: addresses.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          final address = addresses[index];
                          return SingleAddressWidget(
                            address: address,
                            onTap: () => addressController.selectAddress(address),
                          );
                        });
                  }),
            ),
          ),
        ));
  }
}

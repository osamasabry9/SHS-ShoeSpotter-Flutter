import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/cloud_helper_functions.dart';
import '../../../../../core/utils/helpers/network_manager.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../../../core/widgets/texts/section_heading.dart';
import '../../../data/models/address_model.dart';
import '../../../domain/usecases/fetch_user_address_usecase.dart';
import '../../../domain/usecases/save_user_address_usecase.dart';
import '../../../domain/usecases/update_user_address_usecase.dart';
import '../../pages/address/widgets/single_address_widget.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final postalCode = TextEditingController();

  RxBool refreshData = true.obs;
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await di.getIt<FetchUserAddressUseCase>().call();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      AppLoaders.errorSnackBar(
          title: "Address not fount", message: e.toString());
      return [];
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async => false,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator());

      // Clear the selected address filed
      final selectedAddressId = selectedAddress.value.id;
      if (selectedAddressId.isNotEmpty) {
        await di
            .getIt<UpdateUserAddressUseCase>()
            .call(addressId: selectedAddressId, selectedAddress: false);
      }

      // assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // set the selected address filed
      await di
          .getIt<UpdateUserAddressUseCase>()
          .call(addressId: selectedAddress.value.id, selectedAddress: true);

      Get.back();
    } catch (e) {
      Get.back();
      AppLoaders.errorSnackBar(
          title: "Error in selection", message: e.toString());
    }
  }

  Future<void> saveNewAddress() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Storing address...', AppImages.docerAnimation);

      // check internet connection
      final isConnected = NetworkManager.instance.isConnected;
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
// form validation
      if (!addressFormKey.currentState!.validate()) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }

      // save address data
      final newAddress = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim(),
          postalCode: postalCode.text.trim(),
          dateTime: DateTime.now(),
          selectedAddress: true);

      final addressId =
          await di.getIt<SaveUserAddressUseCase>().call(address: newAddress);

      // Update selected address state
      newAddress.id = addressId;
      selectAddress(newAddress);

      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      // show success message
      AppLoaders.successSnackBar(
          title: "Address saved successfully!",
          message: "Your address has been saved successfully");

      // refresh addresses data
      refreshData.toggle();
      // reset fields
      resetFormFields();

// redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      AppLoaders.errorSnackBar(
          title: "Error in saving address", message: e.toString());
    }
  }

// Show address ModalBottomSheet at checkout page
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(
                  title: 'Select Address', showActionButton: false),
              FutureBuilder(
                  future: getAllUserAddresses(),
                  builder: (_, snapshot) {
                    // Helper functions : handel loading and error states
                    final response =
                        AppCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot);
                    if (response != null) return response;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) => SingleAddressWidget(
                          address: snapshot.data![index],
                          onTap: () async {
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          }),
                    );
                  }),
              const SizedBox(height: AppSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.addNewAddressScreen),
                  child: const Text('Add New Address'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    country.clear();
    postalCode.clear();
    addressFormKey.currentState?.reset();
  }
}

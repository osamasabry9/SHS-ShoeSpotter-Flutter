import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../controllers/address/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
          title: Text("Add new Address"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
              key: addressController.addressFormKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: addressController.name,
                      validator: (value) =>
                          AppValidator.validateName("Name", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user), labelText: "Name")),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  TextFormField(
                      controller: addressController.phoneNumber,
                      validator: (value) =>
                          AppValidator.validatePhoneNumber(value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.mobile),
                          labelText: "Phone Number")),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                              controller: addressController.street,
                              validator: (value) =>
                                  AppValidator.validateName("Street", value),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.building_31),
                                  labelText: "Street"))),
                      const SizedBox(width: AppSizes.spaceBtwInputFields),
                      Expanded(
                          child: TextFormField(
                              controller: addressController.postalCode,
                              validator: (value) => AppValidator.validateName(
                                  "Postal Code", value),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.code),
                                  labelText: "Postal Code"))),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                              controller: addressController.city,
                              validator: (value) =>
                                  AppValidator.validateName("City", value),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.building),
                                  labelText: "City"))),
                      const SizedBox(width: AppSizes.spaceBtwInputFields),
                      Expanded(
                          child: TextFormField(
                              controller: addressController.state,
                              validator: (value) =>
                                  AppValidator.validateName("State", value),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.activity),
                                  labelText: "State"))),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  TextFormField(
                      controller: addressController.country,
                      validator: (value) =>
                          AppValidator.validateName("Country", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.global),
                          labelText: "Country")),
                  const SizedBox(height: AppSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => addressController.saveNewAddress(),
                        child: const Text("Save")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

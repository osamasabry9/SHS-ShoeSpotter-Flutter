import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../../../core/widgets/appBar/custom_app_bar.dart';
import '../../controllers/user/update_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Change Name",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                  "Use real name for easy verification. This name will appear on several pages.",
                  style: Theme.of(context).textTheme.labelMedium),

              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Text fields and buttons
              Form(
                  key: controller.updateUserNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstNameController,
                        validator: (value) =>
                            AppValidator.validateName("First Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: AppTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),

                      const SizedBox(height: AppSizes.spaceBtwItems),
                      TextFormField(
                        controller: controller.lastNameController,
                        validator: (value) =>
                            AppValidator.validateName("Last Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: AppTexts.lastName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),

                      const SizedBox(height: AppSizes.spaceBtwSections),

                      // Save button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.updateUserName(),
                          child: const Text("Save"),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

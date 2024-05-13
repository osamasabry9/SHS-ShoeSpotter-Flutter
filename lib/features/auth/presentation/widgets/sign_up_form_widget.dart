import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/validators/validation.dart';
import '../controllers/sign_up/sign_up_controller.dart';
import 'terms_and_conditions_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          // first name and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      AppValidator.validateName(AppTexts.firstName, value),
                  decoration: const InputDecoration(
                    labelText: AppTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      AppValidator.validateName(AppTexts.lastName, value),
                  controller: controller.lastName,
                  decoration: const InputDecoration(
                    labelText: AppTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                AppValidator.validateName(AppTexts.username, value),
            decoration: const InputDecoration(
              labelText: AppTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // email
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: AppTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // phone
          TextFormField(
            validator: (value) => AppValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: AppTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: AppTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          // Terms and conditions checkbox
          const TermsAndConditionsWidget(),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          // create account button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signUp(),
                child: const Text(AppTexts.createAccount)),
          )
        ],
      ),
    );
  }
}

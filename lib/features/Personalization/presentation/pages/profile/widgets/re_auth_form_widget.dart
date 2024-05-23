import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/utils/constants/text_strings.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/validators/validation.dart';
import '../../../controllers/user/user_controller.dart';

class ReAuthFormWidget extends StatelessWidget {
  const ReAuthFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Form(
      key: controller.reAuthFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email

          TextFormField(
            controller: controller.verifyEmail,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AppTexts.email),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),

          // Password
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.verifyPassword,
              validator: (value) => AppValidator.validatePassword(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: controller.hidePassword.value
                        ? const Icon(Iconsax.eye)
                        : const Icon(Iconsax.eye_slash),
                  ),
                  labelText: AppTexts.password),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),

          // Buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
              child: const Text('Verify'),
            ),
          ),
        ],
      ),
    );
  }
}

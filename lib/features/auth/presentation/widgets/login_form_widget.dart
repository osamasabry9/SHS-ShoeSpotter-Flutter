import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/extensions.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(
              labelText: AppTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            )),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: AppTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash),
                )),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields / 2,
            ),
            // remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(AppTexts.rememberMe),
                  ],
                ),
                // forget password
                TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.forgotPasswordScreen);
                  },
                  child: const Text(AppTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            // login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.mainScreen);
                },
                child: const Text(AppTexts.signIn),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            // register button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  context.pushNamed(Routes.signUpScreen);
                },
                child: const Text(
                  AppTexts.createAccount,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

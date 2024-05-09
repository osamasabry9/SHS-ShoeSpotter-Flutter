import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/extensions.dart';
import '../cubit/sign_up_cubit.dart';
import 'terms_and_conditions_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          // first name and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: context.read<SignUpCubit>().firstNameController,
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
                  controller: context.read<SignUpCubit>().lastNameController,
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
            controller: context.read<SignUpCubit>().userNameController,
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
            controller: context.read<SignUpCubit>().emailController,
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
            controller: context.read<SignUpCubit>().phoneNumberController,
            decoration: const InputDecoration(
              labelText: AppTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          // password
          TextFormField(
            obscureText: true,
            controller: context.read<SignUpCubit>().passwordController,
            decoration: const InputDecoration(
              labelText: AppTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
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
                onPressed: () {
                  if (context
                      .read<SignUpCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignUpCubit>().emitSignUpStates();
                    context
                        .pushReplacementNamed(Routes.emailVerificationScreen);
                  }
                },
                child: const Text(AppTexts.createAccount)),
          )
        ],
      ),
    );
  }
}

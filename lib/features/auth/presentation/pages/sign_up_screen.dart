import 'package:flutter/material.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/widgets/auth/form_divider_widget.dart';
import '../../../../core/widgets/auth/social_buttons_widget.dart';
import '../widgets/sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const SignUpFormWidget(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const FormDividerWidget(dividerText: AppTexts.orSignUpWith),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const SocialButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

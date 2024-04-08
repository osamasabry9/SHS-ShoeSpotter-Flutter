import 'package:flutter/material.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/styles/spacing_styles.dart';
import '../../../../core/widgets/auth/form_divider_widget.dart';
import '../../../../core/widgets/auth/social_buttons_widget.dart';
import '../widgets/header_login_and_welcome_widget.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: AppSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // Header logo and welcome text
            HeaderLoginAndWelcomeWidget(),
            // form with email and password and tow buttons - login and register
            LoginFormWidget(),
            // divider
            FormDividerWidget(dividerText: AppTexts.orSignInWith),
            SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            // login with google and facebook social media
            SocialButtonsWidget(),
          ],
        ),
      ),
    ));
  }
}

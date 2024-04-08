import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/helpers/extensions.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.loginScreen);
          },
          icon: const Icon(CupertinoIcons.clear),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                // Image
                Image(
                  image: const AssetImage(AppImages.deliveredEmailIllustration),
                  width: AppHelperFunctions.screenWidth(context) * 0.6,
                  // height: AppHelperFunctions.screenHeight(context) * 0.5,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),

                // title and subtitle
                Text(
                  AppTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                Text(
                  AppTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                // buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushReplacementNamed(Routes.loginScreen);
                    },
                    child: const Text(AppTexts.done),
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(Routes.loginScreen);
                    },
                    child: const Text(AppTexts.resendEmail),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

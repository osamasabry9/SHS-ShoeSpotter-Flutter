import 'package:flutter/material.dart';
import '../utils/helpers/extensions.dart';
import '../utils/models/success_items_model.dart';
import '../utils/styles/spacing_styles.dart';

import '../utils/constants/sizes.dart';
import '../utils/constants/text_strings.dart';
import '../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final SuccessItemsModel itemsModel;
  const SuccessScreen({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(itemsModel.image),
                width: AppHelperFunctions.screenWidth(context) * 0.6,
                // height: AppHelperFunctions.screenHeight(context) * 0.5,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              // title and subtitle
              Text(
                itemsModel.title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),

              Text(
                itemsModel.subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    context.pushReplacementNamed(itemsModel.routeName);
                  },
                  child: const Text(AppTexts.tContinue),
                ),
              ),
            ],
          )),
    ));
  }
}

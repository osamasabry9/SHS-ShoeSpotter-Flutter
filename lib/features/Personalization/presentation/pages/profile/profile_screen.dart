import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';

import '../../controllers/user/user_controller.dart';
import 'widgets/header_personal_info_section_widget.dart';
import 'widgets/header_profile_info_section_widget.dart';

import 'widgets/profile_picture_section_widget.dart';

import '../../../../../core/widgets/appBar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: const CustomAppBar(
          title: Text("Profile"),
          showBackArrow: true,
        ),

        /// body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(children: [
              // profile picture
               const ProfilePictureSectionWidget( ),

              /// Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              /// Header profile information
              const HeaderProfileInfoSectionWidget(),

              /// Header Personal information
              const HeaderPersonalInfoSectionWidget(),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarning(),
                    child: const Text("Close Account",
                        style: TextStyle(color: Colors.red))),
              )
            ]),
          ),
        ));
  }
}

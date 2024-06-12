import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/helpers/network_manager.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../domain/usecases/update_single_field_usecase.dart';
import 'user_controller.dart';

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance => Get.find();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  final userController = UserController.instance;

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstNameController.text = userController.user.value.firstName;
    lastNameController.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Updating...", AppImages.docerAnimation);

      // check internet connection
      final isConnected =  NetworkManager.instance.isConnected;
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }

      // form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      // update user name
      Map<String, dynamic> name = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
      };
      await di.getIt<UpdateSingleFieldUseCase>().call(name);

      // Update the Rx user value
      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();

      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      // Show success message
      AppLoaders.successSnackBar(
          title: 'Success', message: 'Name updated successfully');
      Get.offNamed(Routes.profileScreen);
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      // Show some Generic error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

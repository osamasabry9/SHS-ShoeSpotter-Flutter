import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../auth/domain/usecases/sign_with_google_usecase.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/api_constants.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/helpers/network_manager.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../domain/usecases/delete_user_account_usecase.dart';
import '../../../domain/usecases/fetch_user_details_usecase.dart';
import '../../../domain/usecases/logout_user_usecase.dart';
import '../../../domain/usecases/re_authenticate_email_and_password_usecase.dart';
import '../../../domain/usecases/save_user_data_usecase.dart';
import '../../../domain/usecases/save_user_record_in_firestore_usecase.dart';

import '../../../../../app/di.dart' as di;
import '../../../domain/usecases/update_single_field_usecase.dart';
import '../../../domain/usecases/upload_image_usecase.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final imageUploading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final user = await di.getIt<FetchUserDetailsUseCase>().call();
      this.user(user);
      profileLoading(false);
    } catch (e) {
      user(UserModel.empty());
      profileLoading(false);
    }
  }

  // Saves user data to Firestore based on the provided UserCredential.
  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      // First update
      await fetchUserRecord();

      if (user.value.uid.isEmpty) {
        if (userCredential != null) {
          await di.getIt<SaveUserDataUseCase>().call(userCredential);
        }
      }
    } catch (e) {
      AppLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              " Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }

  // Function to save user record in Firestore.
  Future<void> saveUserRecordInFirestore(UserModel user) async {
    try {
      await di.getIt<SaveUserRecordInFirestoreUseCase>().call(user);
    } catch (e) {
      AppLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              " Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }

  // Logout user - valid for any authentication.
  Future<void> logoutUser() async {
    await di.getIt<LogoutUserUseCase>().call();
  }

// Delete Account warning for any authentication.
  void deleteAccountWarning() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be permanently deleted.",
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
            child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  // Delete user account - Remove user Auth and data from firestore.
  Future<void> deleteUserAccount() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Processing...", AppImages.docerAnimation);

      // first re-authenticate user
      final user = di.getIt<FirebaseAuth>().currentUser;
      final provider = user!.providerData[0].providerId;
      if (provider.isNotEmpty) {
        // re verify auth email
        if (provider == "google.com") {
          await di.getIt<SignWithGoogleUseCase>().call();
          await di.getIt<DeleteUserAccountUseCase>().call();
          AppFullScreenLoader.closeLoadingDialog();
          Get.offAllNamed(Routes.loginScreen);
        } else if (provider == "password") {
          AppFullScreenLoader.closeLoadingDialog();
          Get.toNamed(Routes.reAuthLoginFormScreen);
        }
      }
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();

      AppLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
    await di.getIt<DeleteUserAccountUseCase>().call();
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // start loading
      AppFullScreenLoader.openLoadingDialog(
          "Processing...", AppImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }

      // form validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove loading
        AppFullScreenLoader.closeLoadingDialog();
        return;
      }
      await di.getIt<ReAuthenticateEmailAndPasswordUseCase>().call(
          email: verifyEmail.text.trim(), password: verifyPassword.text.trim());
      await di.getIt<DeleteUserAccountUseCase>().call();
      user(UserModel.empty());
      AppFullScreenLoader.closeLoadingDialog();
      Get.offAllNamed(Routes.loginScreen);
    } catch (e) {
      // Remove loading
      AppFullScreenLoader.closeLoadingDialog();
      AppLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      // pick image
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // upload image
        final imageUrl = await di
            .getIt<UploadImageUseCase>()
            .call(path: FirebaseConst.PATH_IMAGE_USER_COLLECTION, image: image);
        // update user profile picture
        Map<String, dynamic> json = {"profileUrl": imageUrl};
        await di.getIt<UpdateSingleFieldUseCase>().call(json);

        user.value.profileUrl = imageUrl;
        user.refresh();
        
        AppLoaders.successSnackBar(
            title: "Success", message: "Profile picture updated successfully");
      }
    } catch (e) {
      AppLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}

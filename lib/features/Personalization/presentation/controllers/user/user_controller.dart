import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/popups/loaders.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../domain/usecases/save_user_data_usecase.dart';
import '../../../domain/usecases/save_user_record_in_firestore_usecase.dart';

import '../../../../../app/di.dart' as di;

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Saves user data to Firestore based on the provided UserCredential.
  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        await di.getIt<SaveUserDataUseCase>().call(userCredential);
      }
    } catch (e) {
      AppLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              " Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }

  // Function to save user record in Firestore with error handling for different exceptions.
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
}

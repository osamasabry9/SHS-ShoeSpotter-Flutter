import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/exceptions/firebase_auth_exception.dart';
import '../../../../core/utils/exceptions/firebase_exception.dart';
import '../../../../core/utils/exceptions/format_exception.dart';
import '../../../../core/utils/exceptions/platform_exception.dart';
import '../../../auth/data/models/user_model.dart';
import 'personalization_remote_data_source.dart';

class PersonalizationRemoteDataSourceImpl
    implements PersonalizationRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  PersonalizationRemoteDataSourceImpl(
      {required this.firebaseFirestore,
      required this.firebaseAuth,
      required this.firebaseStorage});

  @override
  Future<void> deleteUserAccount() async {
    try {
      await firebaseAuth.currentUser!.delete();
      await firebaseAuth.signOut();
      Get.offAllNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await GoogleSignIn().signOut();
      await firebaseAuth.signOut();
      Get.offAllNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert full name into first and last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? "");

        // Map user data to user model
        final user = UserModel(
            uid: userCredential.user!.uid,
            email: userCredential.user!.email ?? "",
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts[1] : "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            username: username,
            profileUrl: userCredential.user!.photoURL ?? "");
        await saveUserRecordInFirestore(user);
      }
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<void> saveUserRecordInFirestore(UserModel user) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(user.uid)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }
}

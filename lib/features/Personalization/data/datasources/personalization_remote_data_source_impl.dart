import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

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
  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      // Convert full name into first and last name
      final nameParts =
          UserModel.nameParts(userCredential?.user!.displayName ?? "");
      final username =
          UserModel.generateUsername(userCredential?.user!.displayName ?? "");

      // Map user data to user model
      final user = UserModel(
          uid: userCredential!.user!.uid,
          email: userCredential.user!.email ?? "",
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts[1] : "",
          phoneNumber: userCredential.user!.phoneNumber ?? "",
          username: username,
          profileUrl: userCredential.user!.photoURL ?? "");
      debugPrint("********Save user data ");
      await saveUserRecordInFirestore(user);
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
      debugPrint("************Save user data in firestore");
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
  Future<UserModel> fetchUserDetails() async {
    try {
      final userDocumentSnapshot = await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      if (userDocumentSnapshot.exists) {
        return UserModel.fromSnapshot(userDocumentSnapshot);
      } else {
        return UserModel.empty();
      }
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
  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await firebaseAuth.currentUser!.reauthenticateWithCredential(credential);
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
  Future<void> deleteUserAccount() async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(firebaseAuth.currentUser!.uid)
          .delete();
      await firebaseAuth.currentUser!.delete();
      await firebaseAuth.signOut();
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
  Future<void> updateUserDetails(UserModel user) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(firebaseAuth.currentUser!.uid)
          .update(user.toJson());
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
  Future<void> updateSingleField(Map<String, dynamic> jsonField) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(firebaseAuth.currentUser!.uid)
          .update(jsonField);
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
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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

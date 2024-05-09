import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/api_constants.dart';
import '../models/sign_in_request.dart';
import '../models/sign_up_request.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  UserRemoteDataSourceImpl(
      {required this.firebaseStorage,
      required this.firebaseFirestore,
      required this.firebaseAuth});

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  @override
  Future<void> signInUser(SignInRequest user) async {
    try {
      if (user.email.isNotEmpty && user.password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email, password: user.password);
      } else {
        debugPrint("fields cannot be empty");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        // AppConstants.toast("user not found");
      } else if (e.code == "wrong-password") {
        //  AppConstants.toast("Invalid email or password");
      }
    }
  }

  @override
  Future<void> signUpUser(SignUpRequest user) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((currentUser) async {
        if (currentUser.user?.uid != null) {
          createUser(user);
        }
      });
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        // AppConstants.toast("email is already taken");
      } else {
        //AppConstants.toast("something went wrong");
      }
    }
  }

  @override
  Future<void> createUser(SignUpRequest user) async {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);

    final uid = await getCurrentUid();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = SignUpRequest(
        email: user.email,
        password: '',
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        username: user.username,
      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      //AppConstants.toast("Some error occur");
    });
  }
}

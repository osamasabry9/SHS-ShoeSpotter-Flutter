import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../../../../core/utils/constants/api_constants.dart';
import '../models/address_model.dart';

import '../../../../core/utils/exceptions/firebase_exception.dart';
import '../../../../core/utils/exceptions/format_exception.dart';
import '../../../../core/utils/exceptions/platform_exception.dart';
import 'address_remote_data_source.dart';

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  AddressRemoteDataSourceImpl(
      {required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.firebaseStorage});

  @override
  Future<void> deleteUserAddress(AddressModel address) async {
    try {
      // TODO: implement deleteUserAddress
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong when deleting address. please try again.';
    }
  }

  @override
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {

      final userId = firebaseAuth.currentUser!.uid;
      if (userId.isEmpty) {
        throw "Unable to find user information. try again in few minutes.";
      }

      final querySnapshot = await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(userId)
          .collection(FirebaseConst.ADDRESS_COLLECTION)
          .get();

      final addresses = querySnapshot.docs
          .map((document) => AddressModel.fromDocumentSnapshot(document))
          .toList();
      return addresses;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong when fetching address. please try again.';
    }
  }

  @override
  Future<String> saveUserAddress(AddressModel address) async {
    try {
      final userId = firebaseAuth.currentUser!.uid;
      final addressDoc = await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(userId)
          .collection(FirebaseConst.ADDRESS_COLLECTION)
          .add(address.toJson());
      return addressDoc.id;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong when saving address. please try again.';
    }
  }

  @override
  Future<void> updateUserAddress(String addressId, bool selectedAddress) async {
    try {
      final userId = firebaseAuth.currentUser!.uid;

      await firebaseFirestore
          .collection(FirebaseConst.USERS_COLLECTION)
          .doc(userId)
          .collection(FirebaseConst.ADDRESS_COLLECTION)
          .doc(addressId)
          .update({'selectedAddress': selectedAddress});
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong when updating address. please try again.';
    }
  }
}

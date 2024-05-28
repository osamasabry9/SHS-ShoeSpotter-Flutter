import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';


import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/exceptions/firebase_exception.dart';
import '../../../../core/utils/exceptions/platform_exception.dart';
import '../models/category_model.dart';
import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  CategoryRemoteDataSourceImpl(
      {required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.firebaseStorage});

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.CATEGORIES_COLLECTION)
          .get();

      final listCategories = response.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();

      return listCategories;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<CategoryModel> getCategoryById(String id) async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.CATEGORIES_COLLECTION)
          .doc(id)
          .get();
      final category = CategoryModel.fromSnapshot(response);
      return category;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<List<CategoryModel>> getFeaturedCategories() async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.CATEGORIES_COLLECTION)
          .where('isFeatured', isEqualTo: true)
          .get();
      final listCategories = response.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return listCategories;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<List<CategoryModel>> getSubCategories(String id) async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.CATEGORIES_COLLECTION)
          .doc(id)
          .collection(FirebaseConst.SUBCATEGORIES_COLLECTION)
          .get();
      final listCategories = response.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return listCategories;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<void> uploadCategory(CategoryModel category) async {
    try{
      await firebaseFirestore
          .collection(FirebaseConst.CATEGORIES_COLLECTION)
          .doc(category.id)
          .set(category.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }
}

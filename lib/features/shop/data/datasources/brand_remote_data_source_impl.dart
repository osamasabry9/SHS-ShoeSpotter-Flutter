import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/exceptions/firebase_exception.dart';
import '../../../../core/utils/exceptions/platform_exception.dart';
import '../models/brand_model.dart';
import 'brand_remote_data_source.dart';

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  BrandRemoteDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.BRANDS_COLLECTION)
          .get();

      final listCategories = response.docs
          .map((document) => BrandModel.fromSnapshot(document))
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
  Future<void> uploadBrand(BrandModel brand) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.BRANDS_COLLECTION)
          .doc(brand.id)
          .set(brand.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<BrandModel> getBrandById(String id) async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.BRANDS_COLLECTION)
          .doc(id)
          .get();

      final brand = BrandModel.fromSnapshot(response);
      return brand;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId is equal to categoryId
      QuerySnapshot brandCategoryQuery = await firebaseFirestore
          .collection(FirebaseConst.BRAND_CATEGORY_COLLECTION)
          .where('categoryId', isEqualTo: categoryId)
          .get();
      // Extract the brandId from each document
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      // Query to get all documents where brandId is in brandIds list , FieldPath.documentId to query by documents in collection

      final brandsQuery = await firebaseFirestore
          .collection(FirebaseConst.BRANDS_COLLECTION)
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Convert each document to BrandModel and add to list
      final listCategories = brandsQuery.docs
          .map((document) => BrandModel.fromSnapshot(document))
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
}

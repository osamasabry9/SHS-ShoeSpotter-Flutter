import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/exceptions/firebase_exception.dart';
import '../../../../core/utils/exceptions/platform_exception.dart';
import '../models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  ProductRemoteDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final listProducts = querySnapshot.docs
          .map((document) => ProductModel.fromQuerySnapshot(document))
          .toList();

      return listProducts;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.PRODUCTS_COLLECTION)
          .doc(id)
          .get();
      final product = ProductModel.fromSnapshot(response);
      return product;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<List<ProductModel>> getFeaturedProducts(int limit) async {
    try {
      final response = limit > 0
          ? await firebaseFirestore
              .collection(FirebaseConst.PRODUCTS_COLLECTION)
              .where('isFeatured', isEqualTo: true)
              .limit(limit)
              .get()
          : await firebaseFirestore
              .collection(FirebaseConst.PRODUCTS_COLLECTION)
              .where('isFeatured', isEqualTo: true)
              .get();

      final listProducts = response.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
      return listProducts;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<void> uploadProduct(ProductModel product) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.PRODUCTS_COLLECTION)
          .doc(product.id)
          .set(product.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }
  
  @override
  Future<List<ProductModel>> getProductsForBrand(String brandId, int limit)async {
    try {
      final response = limit != -1
          ? await firebaseFirestore
              .collection(FirebaseConst.PRODUCTS_COLLECTION)
              .where('brand.id', isEqualTo: brandId)
              .limit(limit)
              .get()
          : await firebaseFirestore
              .collection(FirebaseConst.PRODUCTS_COLLECTION)
              .where('brand.id', isEqualTo: brandId)
              .get();
      final listProducts = response.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
      return listProducts;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. While fetching products for brand. please try again.';
    }
  }
    @override
  Future<List<ProductModel>> getProductsForCategory(String categoryId, int limit)async {
    try {
      // Query to get all documents where categoryId is equal to categoryId 
      QuerySnapshot productCategoryQuery = limit != -1
          ? await firebaseFirestore
              .collection(FirebaseConst.PRODUCT_CATEGORY_COLLECTION)
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get()
          : await firebaseFirestore
              .collection(FirebaseConst.PRODUCT_CATEGORY_COLLECTION)
              .where('categoryId', isEqualTo: categoryId)
              .get();
// Extract the productId from each document
List<String> productIds = productCategoryQuery.docs
        .map((doc) => doc['productId'] as String)
        .toList();
// Query to get all documents where productId is in productIds list , FieldPath.documentId to query by documents in collection
      final productsQuery = await firebaseFirestore
          .collection(FirebaseConst.PRODUCTS_COLLECTION)
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
// Convert each document to ProductModel and add to list
      final listProducts = productsQuery.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
      return listProducts;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. While fetching products for category. please try again.';
    }
  }
}

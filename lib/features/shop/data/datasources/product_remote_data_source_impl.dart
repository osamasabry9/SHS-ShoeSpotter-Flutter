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
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.PRODUCTS_COLLECTION)
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
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.PRODUCTS_COLLECTION)
          .where('isFeatured', isEqualTo: true)
          .limit(4)
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
}

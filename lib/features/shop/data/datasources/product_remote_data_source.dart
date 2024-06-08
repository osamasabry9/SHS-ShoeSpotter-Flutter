import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsByQuery(Query query);

  Future<List<ProductModel>> getProductsForBrand(String brandId, int limit);

  Future<List<ProductModel>> getProductsForCategory(
      String categoryId, int limit);

  Future<List<ProductModel>> getFeaturedProducts(int limit);

  Future<ProductModel> getProductById(String id);

  Future<void> uploadProduct(ProductModel product);
}

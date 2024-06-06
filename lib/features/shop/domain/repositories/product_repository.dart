import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductsByQuery(Query query);

  Future<List<ProductModel>> getFeaturedProducts( int limit);

  Future<ProductModel> getProductById(String id);

  Future<void> uploadProduct(ProductModel product);
}

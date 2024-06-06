import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<List<ProductModel>> getProductsByQuery(Query query) async =>
      await productRemoteDataSource.getProductsByQuery(query);

  @override
  Future<ProductModel> getProductById(String id) async =>
      await productRemoteDataSource.getProductById(id);

  @override
  Future<List<ProductModel>> getFeaturedProducts( int limit) async =>
      await productRemoteDataSource.getFeaturedProducts( limit) ;

  @override
  Future<void> uploadProduct(ProductModel product) async =>
      await productRemoteDataSource.uploadProduct(product);
}

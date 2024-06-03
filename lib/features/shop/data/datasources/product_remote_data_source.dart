import '../models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getFeaturedProducts();

  Future<ProductModel> getProductById(String id);

  Future<void> uploadProduct(ProductModel product);
}
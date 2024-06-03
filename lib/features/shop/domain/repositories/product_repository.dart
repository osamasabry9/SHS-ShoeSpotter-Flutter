import '../../data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();

  Future<List<ProductModel>> getFeaturedProducts();

  Future<ProductModel> getProductById(String id);

  Future<void> uploadProduct(ProductModel product);
}

import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<List<ProductModel>> getAllProducts() async =>
      await productRemoteDataSource.getAllProducts();

  @override
  Future<ProductModel> getProductById(String id) async =>
      await productRemoteDataSource.getProductById(id);

  @override
  Future<List<ProductModel>> getFeaturedProducts() async =>
      await productRemoteDataSource.getFeaturedProducts();

  @override
  Future<void> uploadProduct(ProductModel product) async =>
      await productRemoteDataSource.uploadProduct(product);
}

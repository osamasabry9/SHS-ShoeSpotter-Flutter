import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetProductsForBrandUseCase {
  final ProductRepository repository;

  GetProductsForBrandUseCase({required this.repository});

  Future<List<ProductModel>> call({required String brandId , required int limit}) async =>
      await repository.getProductsForBrand(brandId, limit);
}
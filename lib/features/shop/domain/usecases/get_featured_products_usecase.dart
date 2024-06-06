import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetFeaturedProductsUseCase {
  final ProductRepository repository;

  GetFeaturedProductsUseCase({required this.repository});

  Future<List<ProductModel>> call({required int limit}) async =>
      await repository.getFeaturedProducts(limit);
}

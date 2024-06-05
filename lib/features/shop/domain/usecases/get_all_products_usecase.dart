import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository repository;

  GetAllProductsUseCase({required this.repository});

  Future<List<ProductModel>> call() async =>
      await repository.getAllProducts();
}

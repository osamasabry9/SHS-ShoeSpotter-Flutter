import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase({required this.repository});

  Future<ProductModel> call({required String id}) async =>
      await repository.getProductById( id);
}

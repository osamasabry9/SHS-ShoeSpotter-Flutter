import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class UploadProductUseCase {
  final ProductRepository repository;

  UploadProductUseCase({required this.repository});

  Future<void> call({required ProductModel product}) async =>
      await repository.uploadProduct(product);
}

import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetProductsForCategoryUseCase {

  final ProductRepository repository;

  GetProductsForCategoryUseCase({required this.repository});


  Future<List<ProductModel>> call({required String categoryId, required int limit}) async =>
      await repository.getProductsForCategory(categoryId, limit);


}
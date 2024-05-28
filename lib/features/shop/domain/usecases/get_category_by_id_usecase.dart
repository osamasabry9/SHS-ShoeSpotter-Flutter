import '../../data/models/category_model.dart';
import '../repositories/category_repository.dart';

class GetCategoryByIdUseCase {
  final CategoryRepository repository;

  GetCategoryByIdUseCase({required this.repository});

  Future<CategoryModel> call({required String id}) async =>
      await repository.getCategoryById( id);
}

import '../../data/models/category_model.dart';
import '../repositories/category_repository.dart';

class GetSubCategoriesUseCase {
  final CategoryRepository repository;

  GetSubCategoriesUseCase({required this.repository});

  Future<List<CategoryModel>> call({required String id}) async =>
      await repository.getSubCategories(id);
}

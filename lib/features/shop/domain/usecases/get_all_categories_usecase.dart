import '../../data/models/category_model.dart';
import '../repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase({required this.repository});

  Future<List<CategoryModel>> call() async =>
      await repository.getAllCategories();
}

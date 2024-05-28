import '../../data/models/category_model.dart';
import '../repositories/category_repository.dart';

class GetFeaturedCategoriesUseCase {
  final CategoryRepository repository;

  GetFeaturedCategoriesUseCase({required this.repository});

  Future<List<CategoryModel>> call() async =>
      await repository.getFeaturedCategories();
}

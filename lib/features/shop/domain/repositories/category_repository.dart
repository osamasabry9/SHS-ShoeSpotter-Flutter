import '../../data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllCategories();

  Future<List<CategoryModel>> getFeaturedCategories();

  Future<CategoryModel> getCategoryById(String id);

  Future<List<CategoryModel>> getSubCategories(String id);

  Future<void> uploadCategory(CategoryModel category);
}

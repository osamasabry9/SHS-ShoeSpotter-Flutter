import '../models/category_model.dart';

abstract class CategoryRemoteDataSource{
  Future<List<CategoryModel>> getAllCategories();

  Future<List<CategoryModel>> getFeaturedCategories();

  Future<List<CategoryModel>> getSubCategories(String id);

  Future<CategoryModel> getCategoryById(String id);

  Future<void> uploadCategory(CategoryModel category);
}
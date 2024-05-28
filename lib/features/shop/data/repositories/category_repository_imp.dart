
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_data_source.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl({required this.categoryRemoteDataSource});
  @override
  Future<List<CategoryModel>> getAllCategories() async =>
      await categoryRemoteDataSource.getAllCategories();

  @override
  Future<CategoryModel> getCategoryById(String id) async =>
      await categoryRemoteDataSource.getCategoryById(id);

  @override
  Future<List<CategoryModel>> getFeaturedCategories() async =>
      await categoryRemoteDataSource.getFeaturedCategories();

  @override
  Future<List<CategoryModel>> getSubCategories(String id) async =>
      await categoryRemoteDataSource.getSubCategories(id);

  @override
  Future<void> uploadCategory(CategoryModel category) async =>
      await categoryRemoteDataSource.uploadCategory(category);
}

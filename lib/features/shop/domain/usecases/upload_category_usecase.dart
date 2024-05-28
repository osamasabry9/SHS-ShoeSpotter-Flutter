import '../../data/models/category_model.dart';
import '../repositories/category_repository.dart';

class UploadCategoryUseCase {
  final CategoryRepository repository;

  UploadCategoryUseCase({required this.repository});

  Future<void> call({required CategoryModel category}) async =>
      await repository.uploadCategory(category);
}

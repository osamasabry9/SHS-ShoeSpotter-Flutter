import '../../data/models/brand_model.dart';
import '../repositories/brand_repository.dart';

class GetBrandForCategoryUseCase {
  
  final BrandRepository repository;

  GetBrandForCategoryUseCase({required this.repository});

  Future<List<BrandModel>> call({required String categoryId}) async =>
    await repository.getBrandForCategory(categoryId);
}
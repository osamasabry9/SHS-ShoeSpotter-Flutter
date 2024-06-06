import '../../data/models/brand_model.dart';
import '../repositories/brand_repository.dart';

class GetAllBrandsUseCase {
  final BrandRepository repository;

  GetAllBrandsUseCase({required this.repository});

  Future<List<BrandModel>> call() async =>
      await repository.getAllBrands();
}

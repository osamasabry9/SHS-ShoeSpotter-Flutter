import '../../data/models/brand_model.dart';
import '../repositories/brand_repository.dart';

class UploadBrandUseCase {
  final BrandRepository repository;

  UploadBrandUseCase({required this.repository});

  Future<void> call({required BrandModel brand}) async =>
      await repository.uploadBrand(brand);
}

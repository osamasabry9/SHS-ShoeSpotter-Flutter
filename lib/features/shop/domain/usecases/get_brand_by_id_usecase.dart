import '../../data/models/brand_model.dart';
import '../repositories/brand_repository.dart';

class GetBrandByIdUseCase {
  final BrandRepository repository;

  GetBrandByIdUseCase({required this.repository});

  Future<BrandModel> call({required String id}) async =>
      await repository.getBrandById( id);
}

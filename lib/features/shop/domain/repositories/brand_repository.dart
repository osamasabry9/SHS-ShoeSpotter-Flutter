import '../../data/models/brand_model.dart';

abstract class BrandRepository {
  Future<List<BrandModel>> getAllBrands();
  Future<BrandModel> getBrandById(String id);
  Future<void> uploadBrand(BrandModel brand);
}

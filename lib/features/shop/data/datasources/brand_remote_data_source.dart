import '../models/brand_model.dart';

abstract class BrandRemoteDataSource{
  Future<List<BrandModel>> getAllBrands();
  Future<BrandModel> getBrandById(String id);
  Future<void> uploadBrand(BrandModel brand);
}
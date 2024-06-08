import '../models/brand_model.dart';

abstract class BrandRemoteDataSource{
  Future<List<BrandModel>> getAllBrands();
  Future<BrandModel> getBrandById(String id);

   Future<List<BrandModel>> getBrandForCategory(String categoryId);
  Future<void> uploadBrand(BrandModel brand);
}
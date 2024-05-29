import '../../domain/repositories/brand_repository.dart';
import '../datasources/brand_remote_data_source.dart';
import '../models/brand_model.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandRemoteDataSource brandRemoteDataSource;
  BrandRepositoryImpl({required this.brandRemoteDataSource});
  @override
  Future<List<BrandModel>> getAllBrands() async =>
      await brandRemoteDataSource.getAllBrands();

  @override
  Future<BrandModel> getBrandById(String id) async =>
      await brandRemoteDataSource.getBrandById(id);

  @override
  Future<void> uploadBrand(BrandModel brand) async =>
      await brandRemoteDataSource.uploadBrand(brand);
}

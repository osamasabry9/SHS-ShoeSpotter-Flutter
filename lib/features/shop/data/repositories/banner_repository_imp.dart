
import '../../domain/repositories/banner_repository.dart';
import '../datasources/banner_remote_data_source.dart';
import '../models/banner_model.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource bannerRemoteDataSource;
  BannerRepositoryImpl({required this.bannerRemoteDataSource});
  @override
  Future<List<BannerModel>> getAllBanners() async =>
      await bannerRemoteDataSource.getAllBanners();

  @override
  Future<void> uploadBanner(BannerModel banner) async =>
      await bannerRemoteDataSource.uploadBanner(banner);
}

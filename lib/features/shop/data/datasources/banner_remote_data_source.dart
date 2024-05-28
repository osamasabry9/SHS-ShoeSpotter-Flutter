import '../models/banner_model.dart';

abstract class BannerRemoteDataSource{
  Future<List<BannerModel>> getAllBanners();
  Future<void> uploadBanner(BannerModel banner);
}
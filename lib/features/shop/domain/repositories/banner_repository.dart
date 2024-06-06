import '../../data/models/banner_model.dart';

abstract class BannerRepository {
  Future<List<BannerModel>> getAllBanners();
  Future<void> uploadBanner(BannerModel banner);
}

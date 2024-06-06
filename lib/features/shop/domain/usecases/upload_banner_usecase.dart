import '../../data/models/banner_model.dart';
import '../repositories/banner_repository.dart';

class UploadBannerUseCase {
  final BannerRepository repository;

  UploadBannerUseCase({required this.repository});

  Future<void> call({required BannerModel banner}) async =>
      await repository.uploadBanner(banner);
}

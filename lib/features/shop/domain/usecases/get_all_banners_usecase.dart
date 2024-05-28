import '../../data/models/banner_model.dart';
import '../repositories/banner_repository.dart';

class GetAllBannersUseCase {
  final BannerRepository repository;

  GetAllBannersUseCase({required this.repository});

  Future<List<BannerModel>> call() async =>
      await repository.getAllBanners();
}

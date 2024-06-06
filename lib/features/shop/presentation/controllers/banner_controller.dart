import 'package:get/get.dart';

import '../../../../app/di.dart' as di;
import '../../../../core/repositories/firebase/app_firebase_storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/popups/loaders.dart';
import '../../data/models/banner_model.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/usecases/get_all_banners_usecase.dart';
import '../../domain/usecases/upload_banner_usecase.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final carousalCurrentIndex = 0.obs;

  final isLoading = false.obs;
  RxList<BannerEntity> allBanners = <BannerEntity>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch banners
  Future<void> fetchBanners() async {
    try {
      // show loading while fetching banners
      isLoading.value = true;

      // fetch banners from data source
      final banners = await di.getIt<GetAllBannersUseCase>().call();

      // Update the Banners List
      allBanners.assignAll(banners);
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loading
      isLoading.value = false;
    }
  }

  /// Upload Banners to the cloud firestore
  Future<void> uploadDummyDataBanners(List<BannerModel> banners) async {
    try {
      // Upload all the Banners along with their Images
      final storage = Get.put(AppFirebaseStorageService());

// loop through all the Banners
      for (var banner in banners) {
        // Get image data link from the local assets
        final imageUrl = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload image to the cloud storage
        final imageUrlUploaded = await storage.uploadImageData(
            FirebaseConst.PATH_IMAGE_BANNERS_COLLECTION,
            imageUrl,
            banner.imageUrl);

        // Assign URL to category name attribute
        banner.imageUrl = imageUrlUploaded;

        // store category in the firestore
        await di.getIt<UploadBannerUseCase>().call(banner: banner);
      }
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

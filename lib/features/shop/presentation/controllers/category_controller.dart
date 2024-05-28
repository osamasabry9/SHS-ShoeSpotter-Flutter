import 'package:get/get.dart';

import '../../../../app/di.dart' as di;
import '../../../../core/repositories/firebase/app_firebase_storage_service.dart';
import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/popups/loaders.dart';
import '../../data/models/category_model.dart';
import '../../domain/usecases/get_all_categories_usecase.dart';
import '../../domain/usecases/upload_category_usecase.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load categories data
  ///
  Future<void> fetchCategories() async {
    try {
      // show loading while fetching categories
      isLoading.value = true;

      // fetch categories from data source
      final categories = await di.getIt<GetAllCategoriesUseCase>().call();

      // Update the Categories List
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(categories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loading
      isLoading.value = false;
    }
  }

  ///
  /// -- Load selected category data
  ///

  ///
  /// Get category or sub-category products.
  ///

  /// Upload categories to the cloud firestore
  Future<void> uploadDummyDataCategories(List<CategoryModel> categories) async {
    try {
      // Upload all the categories along with their Images
      final storage = Get.put(AppFirebaseStorageService());

// loop through all the categories
      for (var category in categories) {
        // Get image data link from the local assets
        final imageUrl = await storage.getImageDataFromAssets(category.image);

        // Upload image to the cloud storage
        final imageUrlUploaded = await storage.uploadImageData(
            FirebaseConst.PATH_IMAGE_CATEGORY_COLLECTION,
            imageUrl,
            category.image);

            // Assign URL to category name attribute
            category.image = imageUrlUploaded;

            // store category in the firestore
            await di
                .getIt<UploadCategoryUseCase>()
                .call(category: category);
      }
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

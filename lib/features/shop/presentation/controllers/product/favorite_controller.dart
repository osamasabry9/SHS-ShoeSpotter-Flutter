import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../app/di.dart' as di;

import 'package:get/get.dart';
import 'package:shoe_spotter/core/local_storage/storage_utility.dart';
import 'package:shoe_spotter/core/utils/popups/loaders.dart';

import '../../../../../core/utils/constants/api_constants.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_products_by_query_usecase.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  // Variables

  final RxMap<String, bool> favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initializeFavorites();
  }

// Method to initialize favorites by reading from local storage
  Future<void> initializeFavorites() async {
    final json = AppLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      AppLoaders.successSnackBar(title: 'Added to favorites', message: '');
    } else {
      AppLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();

      favorites.refresh();
      AppLoaders.successSnackBar(title: 'Removed from favorites', message: '');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = jsonEncode(favorites);
    AppLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductEntity>> getFavoriteProducts() async {
    try {
      final favoriteQuery = di
          .getIt<FirebaseFirestore>()
          .collection(FirebaseConst.PRODUCTS_COLLECTION)
          .where(FieldPath.documentId, whereIn: favorites.keys.toList());

      final products = await di
          .getIt<GetProductsByQueryUseCase>()
          .call(query: favoriteQuery);

      return products;
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}

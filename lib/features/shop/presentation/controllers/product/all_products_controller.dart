import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/utils/popups/loaders.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_products_by_query_usecase.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductEntity> products = <ProductEntity>[].obs;

  Future<List<ProductEntity>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) {
        return [];
      }

      final products =
          await di.getIt<GetProductsByQueryUseCase>().call(query: query);

      return products;
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProduct(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Highest Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lowest Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0.0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0.0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      case 'Newest':
        products.sort((a, b) => b.date!.compareTo(a.date!));
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  void assignProducts(List<ProductEntity> products) {
    this.products.assignAll(products);
    sortProduct('Name');
  }
}

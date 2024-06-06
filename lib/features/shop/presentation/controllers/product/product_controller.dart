import 'dart:math';

import 'package:get/get.dart';

import '../../../../../app/di.dart' as di;
import '../../../../../core/repositories/firebase/app_firebase_storage_service.dart';
import '../../../../../core/utils/constants/api_constants.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../data/models/product_model.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_featured_products_usecase.dart';
import '../../../domain/usecases/upload_product_usecase.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductEntity> featuredProducts = <ProductEntity>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts({int limit = 4}) async {
    try {
      // show loading while fetching products
      isLoading.value = true;

      final products =
          await di.getIt<GetFeaturedProductsUseCase>().call(limit: limit);

      featuredProducts.assignAll(products);
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductEntity>> fetchAllFeaturedProducts() async {
    try {
      // i selected limit 0 because i want to fetch all the products
      final products =
          await di.getIt<GetFeaturedProductsUseCase>().call(limit: 0);

      return products;
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

// Get the product price or price range for variations
  String getVariationPrice(ProductEntity product) {
    // if no variations exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return product.salePrice > 0
          ? product.salePrice.toString()
          : product.price.toString();
    }

    double smallestPrice = double.infinity;
    double largestPrice = double.negativeInfinity;

    for (var variation in product.productVariations!) {
      final priceToConsider =
          variation.salePrice > 0.0 ? variation.salePrice : variation.price;

      smallestPrice = min(smallestPrice, priceToConsider);
      largestPrice = max(largestPrice, priceToConsider);
    }

    // if the smallest and largest prices are the same, return the price, else return the price range
    return smallestPrice == largestPrice
        ? largestPrice.toString()
        : '$smallestPrice - $largestPrice';
  }

// Calculate the discount percentage
  String getDiscountPercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice == 0.0 || originalPrice <= 0.0) {
      return '0%';
    }

    double discount = originalPrice - salePrice;
    double percentage = (discount / originalPrice) * 100;
    return '${percentage.toStringAsFixed(0)}%';
  }

  // check product stack status
  String checkProductStackStatus(int stack) {
    return stack > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Upload the Products List
  Future<void> uploadFeaturedProducts(List<ProductModel> products) async {
    try {
      // Start loading
      AppFullScreenLoader.openLoadingDialog(
          "Updating...", AppImages.docerAnimation);

      // Upload all the Products along with their Images
      final storage = Get.put(AppFirebaseStorageService());
      final uploadUseCase = di.getIt<UploadProductUseCase>();

      // Get image data link from the local assets in parallel
      final futures = products.map((product) async {
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);
        final imageUrlUploaded = await storage.uploadImageData(
            FirebaseConst.PATH_IMAGE_PRODUCTS_COLLECTION,
            thumbnail,
            product.thumbnail.toString());
        product.thumbnail = imageUrlUploaded;

        // Upload product images in parallel
        if (product.images != null && product.images!.isNotEmpty) {
          final imageFutures = product.images!.map((image) async {
            final imageUrl = await storage.getImageDataFromAssets(image);
            final imageUrlUploaded = await storage.uploadImageData(
                FirebaseConst.PATH_IMAGE_PRODUCTS_COLLECTION,
                imageUrl,
                image.toString());
            return imageUrlUploaded;
          });
          product.images = await Future.wait(imageFutures);
        }

        // Upload variation images in parallel
        if (product.productType == ProductType.variable.toString() &&
            product.productVariations != null &&
            product.productVariations!.isNotEmpty) {
          final variationFutures =
              product.productVariations!.map((variation) async {
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);
            final imageUrlUploaded = await storage.uploadImageData(
                FirebaseConst.PATH_IMAGE_PRODUCTS_COLLECTION,
                assetImage,
                variation.image.toString());
            variation.image = imageUrlUploaded;
          });
          await Future.wait(variationFutures);
        }

        return product;
      });

      // Store categories in the Firestore in parallel
      await Future.wait(futures.map((future) async {
        final product =
            await future; // Await the future to get the ProductModel
        return uploadUseCase.call(product: product);
      }));
      AppFullScreenLoader.closeLoadingDialog();
    } catch (e) {
      AppFullScreenLoader.closeLoadingDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

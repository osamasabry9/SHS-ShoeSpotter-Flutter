import 'package:get/get.dart';

import '../../../data/models/product_variation_model.dart';
import '../../../domain/entities/product_entity.dart';
import '../cart/cart_controller.dart';
import 'images_controller.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // Select Attribute and update the selected variation
  void onAttributeSelected(
      ProductEntity product, String attributeName, String attributeValue) {
    // when an attribute is selected we will first add that attribute to the selected attributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    // Check if selected attributes matches any variation attributes
    final selectedVariation = product.productVariations!.firstWhere(
        (element) => _isSameAttributeValues(
            element.attributesValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    // Show selected variation quantity already added in cart
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      // if product has variations
      cartController.updateAlreadyAddedProductCount(product);
      // Get quantity in cart
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

// assign the selected variation
    this.selectedVariation.value = selectedVariation;

    // Update the variation stock status
    getProductVariationStockStatus();
  }

  // Check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }
    for (final key in variationAttributes.keys) {
      if (!selectedAttributes.containsKey(key) ||
          variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  // Check attribute availability / Stock in variation
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // pass the variations to check which attributes are available and stock is not 0

    final availableVariationAttributeValues = variations
        .where((variation) =>
            // check empty / out of stock attribute
            variation.attributesValues[attributeName] != null &&
            variation.attributesValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        // fetch all non empty attributes of the variation
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  // Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  String getVariationPrice() {
    return selectedVariation.value.salePrice > 0
        ? selectedVariation.value.salePrice.toString()
        : selectedVariation.value.price.toString();
  }

  // Reset selected attributes when new product is selected
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  @override
  void dispose() {
    resetSelectedAttributes();
    super.dispose();
  }
}

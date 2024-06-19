import 'package:get/get.dart';

import '../../../../../core/local_storage/storage_utility.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../data/models/cart_item_model.dart';
import '../../../domain/entities/product_entity.dart';
import '../product/variation_controller.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt onOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

// add items in the cart
  void addToCart(ProductEntity product) {
    final quantity = productQuantityInCart.value;
    final variation = variationController.selectedVariation.value;
    final productType = product.productType;
    final stock = (productType == ProductType.variable.toString())
        ? variation.stock
        : product.stock;

    if (quantity < 1 ||
        (productType == ProductType.variable.toString() &&
            variation.id.isEmpty) ||
        stock < 1) {
      AppLoaders.customToast(
          message:
              "Select Quantity, Variation or Product is out of stock");
      return;
    }

    final existingIndex = cartItems.indexWhere(
        (element) => element.productId == product.id &&
            element.variationId == variation.id);
    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity += quantity;
    } else {
      cartItems.add(
          convertToCartItem(product, quantity)..variationId = variation.id);
    }

    updateCart();

    AppLoaders.customToast(message: "Your product has been added to the cart");
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity+=1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        // Show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: "Are you sure?",
      middleText: "Do you want to remove this item from the cart?",
      onConfirm: () {
        Get.back();
        cartItems.removeAt(index);
        updateCart();
        AppLoaders.customToast(message: 'product removed from the cart');
      },
      onCancel: () => Get.back(),
    );
  }

// Initialize already added items in cart
  /// Updates the count of already added products in the cart.
  ///
  /// If the product is of type [ProductType.single], the count is calculated
  /// by summing the quantities of all cart items with the same product ID.
  /// If the product is of type [ProductType.variable], the count is calculated
  /// by summing the quantities of all cart items with the same product ID and
  /// the selected variation ID.
  void updateAlreadyAddedProductCount(ProductEntity product) {
    if (product.productType == ProductType.single.toString()) {
      // Calculate the count for single product type
      productQuantityInCart.value = cartItems
          .where((item) => item.productId == product.id)
          .fold(0, (sum, item) => sum + item.quantity);
    } else {
      // Calculate the count for variable product type
      final selectedVariationId = variationController.selectedVariation.value.id;
      productQuantityInCart.value = selectedVariationId.isNotEmpty
          ? cartItems
              .where((item) =>
                  item.productId == product.id &&
                  item.variationId == selectedVariationId)
              .fold(0, (sum, item) => sum + item.quantity)
          : 0;
    }
  }

  // This function converts the product to a cart item
  CartItemModel convertToCartItem(ProductEntity product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      variationId: isVariation ? variation.id : "",
      price: price,
      quantity: quantity,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : "",
      selectedVariation: isVariation ? variation.attributesValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedQuantity = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedQuantity += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    onOfCartItems.value = calculatedQuantity;
  }

  void saveCartItems() {
    final cartItemStrings =
        cartItems.map((element) => element.toJson()).toList();
    AppLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        AppLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));

      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  /// Returns the quantity of a [CartItemModel] in the cart.
  ///
  /// The [productId] and [variationId] are used to identify the cart item.
  ///
  /// Returns the quantity of the cart item or 0 if the cart item is not found.
  int getVariationQuantityInCart(
      String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (CartItemModel item) =>
            item.productId == productId &&
            item.variationId == variationId,
        orElse: () => CartItemModel.empty());

    return foundItem.quantity;
  }

  void clearCart() {
    cartItems.clear();
    productQuantityInCart.value = 0;
    updateCart();
  }
}

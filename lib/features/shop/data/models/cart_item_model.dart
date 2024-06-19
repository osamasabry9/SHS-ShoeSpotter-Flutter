import '../../domain/entities/cart_item_entity.dart';

// ignore: must_be_immutable
class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.productId,
    required super.quantity,
    super.variationId = '',
    super.title = '',
    super.price = 0.0,
    super.image,
    super.brandName,
    super.selectedVariation,
  });
  // Empty cart item
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // Convert cart item model to json
  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "title": title,
      "price": price,
      "quantity": quantity,
      "image": image,
      "variationId": variationId,
      "brandName": brandName,
      "selectedVariation": selectedVariation
    };
  }

  // Convert json to cart item model
  static CartItemModel fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      quantity: json['quantity'],
      title: json['title'],
      price: json['price']?.toDouble(),
      image: json['image'],
      variationId: json['variationId'],
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
    );
  }
}

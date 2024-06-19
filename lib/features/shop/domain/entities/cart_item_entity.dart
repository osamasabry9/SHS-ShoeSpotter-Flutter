// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  String productId;
  String title;
  double price;
  int quantity;
  String? image;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;
  CartItemEntity({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    this.image,
    required this.variationId,
    this.brandName,
    this.selectedVariation,
  });

  @override
  List<Object?> get props => [
        productId,
        title,
        price,
        quantity,
        image,
        variationId,
        brandName,
        selectedVariation
      ];
}

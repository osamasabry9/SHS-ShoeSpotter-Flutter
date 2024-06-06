// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ProductVariationEntity extends Equatable {
  final String id;
  String sku;
  String? description;
  double price;
  double salePrice;
  String image;
  int stock;
  Map<String, String> attributesValues;

  ProductVariationEntity(
      {required this.id,
      required this.sku,
      required this.description,
      required this.price,
      required this.salePrice,
      required this.image,
      required this.stock,
      required this.attributesValues});

  @override
  List<Object?> get props =>
      [id, sku, description, price, salePrice, image, stock, attributesValues];
}

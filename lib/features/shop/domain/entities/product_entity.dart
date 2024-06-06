// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../data/models/brand_model.dart';
import '../../data/models/product_attribute_model.dart';
import '../../data/models/product_variation_model.dart';



class ProductEntity extends Equatable {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductEntity({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  @override
  List<Object?> get props => [
        id,
        stock,
        sku,
        price,
        title,
        date,
        salePrice,
        thumbnail,
        isFeatured,
        brand,
        description,
        categoryId,
        images,
        productType,
        productAttributes,
        productVariations,
      ];
}

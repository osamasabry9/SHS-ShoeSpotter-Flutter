import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/product_entity.dart';
import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variation_model.dart';

// ignore: must_be_immutable
class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.price,
    required super.stock,
    required super.productType,
    super.categoryId,
    super.sku,
    super.description,
    super.salePrice = 0.0,
    super.images,
    super.date,
    super.brand,
    super.isFeatured,
    super.productAttributes,
    super.productVariations,
  });

  // Create an empty product
  static ProductModel empty() => ProductModel(
      id: '', title: '', thumbnail: '', price: 0.0, stock: 0, productType: '');

  // Convert model to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "thumbnail": thumbnail,
      "price": price,
      "stock": stock,
      "productType": productType,
      "categoryId": categoryId,
      "sku": sku,
      "description": description,
      "salePrice": salePrice,
      "images": images,
      "date": date,
      "brand": brand?.toJson(),
      "isFeatured": isFeatured,
      "productAttributes": productAttributes?.map((e) => e.toJson()).toList(),
      "productVariations": productVariations?.map((e) => e.toJson()).toList()
    };
  }

  // Convert document snapshot to model
  static ProductModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      title: data['title'],
      sku: data['sku'],
      thumbnail: data['thumbnail'] ?? '',
      stock: data['stock'] ?? 0,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      productType: data['productType'] ?? '',
      categoryId: data['categoryId'] ?? '',
      description: data['description'] ?? '',
      date: data['date'],
      isFeatured: data['isFeatured'] ?? false,
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      brand: BrandModel.fromJson(data['brand']),
      productAttributes: (data['productAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      title: data['title'],
      sku: data['sku'],
      thumbnail: data['thumbnail'] ?? '',
      stock: data['stock'] ?? 0,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      productType: data['productType'] ?? '',
      categoryId: data['categoryId'] ?? '',
      description: data['description'] ?? '',
      date: data['date'],
      isFeatured: data['isFeatured'] ?? false,
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      brand: BrandModel.fromJson(data['brand']),
      productAttributes: (data['productAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}

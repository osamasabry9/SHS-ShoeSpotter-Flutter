import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/product_category_entity.dart';


class ProductCategoryModel extends ProductCategoryEntity {
  const ProductCategoryModel({
    required super.productId,
    required super.categoryId,
  });

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ProductCategoryModel(
      productId: data['productId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "categoryId": categoryId,
    };
  }
}

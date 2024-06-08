import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/brand_category_entity.dart';

class BrandCategoryModel extends BrandCategoryEntity {
  const BrandCategoryModel({
    required super.brandId,
    required super.categoryId,
  });

  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return BrandCategoryModel(
      brandId: data['brandId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "brandId": brandId,
      "categoryId": categoryId,
    };
  }
}

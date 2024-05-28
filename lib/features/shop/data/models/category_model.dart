// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
   CategoryModel(
      {required super.id,
       required super.name,
       required super.image,
      super.parentId = "",
      required super.isFeatured});

  /// Empty Helper function
  factory CategoryModel.empty() =>  CategoryModel(
      id: '', name: '', image: '', parentId: '', isFeatured: false);

  /// Convert model to json structure so that you can store data in firebase

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "parentId": parentId,
      "isFeatured": isFeatured
    };
  }

  /// Map json oriented document snapshot from firebase to model

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModel(
          id: document.id,
          name: data['name'] ?? "",
          image: data['image'] ?? "",
          parentId: data['parentId'] ?? "",
          isFeatured: data['isFeatured'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
}

// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity{

  BrandModel({
  required super.id,
  required super.name,
   super.isFeatured,
   required super.image,
   super.productsCount
  });

  static BrandModel empty()=> BrandModel(
    id: '',
    name: '',
    image: '',
    productsCount: 0,
    isFeatured: false
  );

  factory BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if(data != null) {
      return BrandModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      productsCount: data['productsCount'] ?? 0,
      isFeatured: data['isFeatured'] ?? false
    );
    }else {
      return BrandModel.empty();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "productsCount": productsCount,
      "isFeatured": isFeatured
    };
  }
}
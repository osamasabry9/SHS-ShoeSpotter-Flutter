// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.imageUrl,
    required super.targetScreen,
    required super.active

  });

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['imageUrl'],
      targetScreen: data['targetScreen'],
      active: data['active']
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      "imageUrl": imageUrl,
      "targetScreen": targetScreen,
      "active": active
    };
  }

}

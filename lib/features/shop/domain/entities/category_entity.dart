// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  String name;
  String image;
  final String parentId;
  final bool isFeatured;

   CategoryEntity(
      {required this.id,
      required this.name,
      required this.image,
      required this.parentId,
      required this.isFeatured});

  @override
  List<Object?> get props => [id, name, image, parentId, isFeatured];
}

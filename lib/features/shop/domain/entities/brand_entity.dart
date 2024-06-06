// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;
  BrandEntity({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });
  
  @override
  List<Object?> get props => [id, name, image, isFeatured, productsCount];

  
}

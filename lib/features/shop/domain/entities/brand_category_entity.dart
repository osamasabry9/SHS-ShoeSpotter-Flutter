import 'package:equatable/equatable.dart';

class BrandCategoryEntity extends Equatable {
  final String brandId;
  final String categoryId;
  const BrandCategoryEntity({
    required this.brandId,
    required this.categoryId,
  });

  @override
  List<Object> get props => [brandId, categoryId];
}

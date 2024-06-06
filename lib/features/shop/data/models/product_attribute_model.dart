// ignore_for_file: must_be_immutable

import '../../domain/entities/product_attribute_entity.dart';

class ProductAttributeModel extends ProductAttributeEntity {


  ProductAttributeModel({
    required super.values,
    required super.name,
  });


  Map<String, dynamic> toJson() {
    return {
      "values": values,
      "name": name
    };
  }


  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
if(json.isEmpty) return ProductAttributeModel(values: const [], name: "");

    return ProductAttributeModel(
      values: List<String>.from(json["values"]),
      name:  json.containsKey("name") ? json["name"] : "",
    );
  }


}

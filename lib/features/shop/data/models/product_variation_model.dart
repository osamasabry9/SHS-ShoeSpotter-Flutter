import '../../domain/entities/product_variation_entity.dart';

// ignore: must_be_immutable
class ProductVariationModel extends ProductVariationEntity {
  ProductVariationModel(
      {required super.id,
      super.sku = '',
      super.image = '',
      super.price = 0.0,
      super.description = '',
      super.salePrice = 0.0,
      super.stock = 0,
      required super.attributesValues});
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributesValues: const {});
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sku": sku,
      "image": image,
      "price": price,
      "description": description,
      "salePrice": salePrice,
      "stock": stock,
      "attributesValues": attributesValues
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
        id: json["id"] ?? '',
        sku: json["sku"] ?? '',
        image: json["image"] ?? '',
        price: double.parse((json["price"] ?? 0.0).toString()),
        description: json["description"] ?? '',
        salePrice: double.parse((json["salePrice"] ?? 0.0).toString()),
        stock: json["stock"] ?? 0,
        attributesValues: Map<String, String>.from(json["attributesValues"]));
  }
}

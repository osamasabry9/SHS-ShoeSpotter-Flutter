import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class GetProductsByQueryUseCase {
  final ProductRepository repository;

  GetProductsByQueryUseCase({required this.repository});

  Future<List<ProductModel>> call({required Query query}) async =>
      await repository.getProductsByQuery(query);
}

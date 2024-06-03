// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ProductAttributeEntity extends Equatable {
  String? name;
  final List<String>? values;

  ProductAttributeEntity({this.name, required this.values});
  
  @override
  List<Object?> get props => [name, values];


}

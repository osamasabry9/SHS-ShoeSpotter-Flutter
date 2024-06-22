import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaymentMethodEntity extends Equatable {
  String name;
  String image;

  PaymentMethodEntity({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [name, image];
}

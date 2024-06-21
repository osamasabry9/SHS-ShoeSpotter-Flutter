import '../../domain/entities/payment_method_entity.dart';

// ignore: must_be_immutable
class PaymentMethodModel extends PaymentMethodEntity {
  PaymentMethodModel({required super.image, required super.name});

  static PaymentMethodModel empty() => PaymentMethodModel(image: '', name: '');
}

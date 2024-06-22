import 'package:equatable/equatable.dart';

import '../../../../core/utils/constants/enums.dart';
import '../../../Personalization/data/models/address_model.dart';
import '../../data/models/cart_item_model.dart';

class OrderEntity extends Equatable {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderData;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderData,
    required this.paymentMethod,
    required this.address,
    required this.deliveryDate,
    required this.items,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        status,
        totalAmount,
        orderData,
        paymentMethod,
        address,
        deliveryDate,
        items,
      ];
}

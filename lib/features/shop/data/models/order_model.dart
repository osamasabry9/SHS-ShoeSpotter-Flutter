import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

import '../../../Personalization/data/models/address_model.dart';
import '../../domain/entities/order_entity.dart';
import 'cart_item_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel(
      {required super.id,
      required super.totalAmount,
      required super.items,
      required super.status,
      required super.orderData,
      super.userId = '',
      super.paymentMethod = 'Paypal',
      super.deliveryDate,
      super.address});

  String get formattedOrderDate =>
      AppHelperFunctions.getFormattedDate(orderData);

  String get formattedDeliveryDate => deliveryDate != null
      ? AppHelperFunctions.getFormattedDate(deliveryDate!)
      : 'N/A';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "totalAmount": totalAmount,
      "items": items
          .map((item) => item.toJson())
          .toList(), // Convert the List<CartItemModel> to a List<Map<String, dynamic>>
      "status": status.toString(), // Convert the OrderStatus to a String
      "orderData": orderData,
      "userId": userId,
      "paymentMethod": paymentMethod,
      "deliveryDate": deliveryDate,
      "address": address
          ?.toJson(), // Convert the AddressModel to a Map<String, dynamic>
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      totalAmount: data['totalAmount'] as double,
      items: (data['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      status: OrderStatus.values
          .firstWhere((status) => status.toString() == data['status']),
      orderData: (data['orderData'] as Timestamp).toDate(),
      userId: data['userId'] as String,
      paymentMethod: data['paymentMethod'] as String,
      deliveryDate: data['deliveryDate'] == null
          ? null
          : (data['deliveryDate'] as Timestamp).toDate(),
      address: data['address'] != null
          ? AddressModel.fromMap(data['address'] as Map<String, dynamic>)
          : null,
    );
  }
}

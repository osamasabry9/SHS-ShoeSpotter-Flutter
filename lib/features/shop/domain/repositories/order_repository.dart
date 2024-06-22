import '../../data/models/order_model.dart';

abstract class OrderRepository {

  Future<List<OrderModel>> getUserOrders();
  Future<OrderModel> getOrderById(String id);
  Future<void> uploadOrder(OrderModel order);
  Future<void> saveOrder(OrderModel order);
}
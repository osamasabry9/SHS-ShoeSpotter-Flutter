import '../models/order_model.dart';

abstract class OrderRemoteDataSource{
   Future<List<OrderModel>> getUserOrders();
  Future<OrderModel> getOrderById(String id);
  Future<void> uploadOrder(OrderModel order);
  Future<void> saveOrder(OrderModel order);
}
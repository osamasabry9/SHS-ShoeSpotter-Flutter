import '../datasources/order_remote_data_source.dart';

import '../../domain/repositories/order_repository.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepositoryImpl({required this.orderRemoteDataSource});

  @override
  Future<List<OrderModel>> getUserOrders() async =>
      await orderRemoteDataSource.getUserOrders();

  @override
  Future<OrderModel> getOrderById(String id) async =>
      await orderRemoteDataSource.getOrderById(id);

  @override
  Future<void> uploadOrder(OrderModel order) async =>
      await orderRemoteDataSource.uploadOrder(order);

  @override
  Future<void> saveOrder(OrderModel order) async =>
      await orderRemoteDataSource.saveOrder(order);
}

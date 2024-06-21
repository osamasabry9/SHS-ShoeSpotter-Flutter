import '../../data/models/order_model.dart';
import '../repositories/order_repository.dart';

class GetUserOrdersUseCase {
  final OrderRepository orderRepository;

  GetUserOrdersUseCase({required this.orderRepository});

  Future<List<OrderModel>> call() async {
    return await orderRepository.getUserOrders();
  }
}
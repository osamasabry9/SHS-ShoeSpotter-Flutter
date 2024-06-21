import '../../data/models/order_model.dart';
import '../repositories/order_repository.dart';

class SaveOrderUseCase {
  final OrderRepository orderRepository;

  SaveOrderUseCase({required this.orderRepository});

  Future<void> call({required OrderModel order}) async =>
      await orderRepository.saveOrder(order);
}
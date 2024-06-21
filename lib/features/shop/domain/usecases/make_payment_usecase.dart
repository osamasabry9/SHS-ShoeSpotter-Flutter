import '../../data/models/stripe_models/payment_intent_input_model.dart';
import '../repositories/checkout_repository.dart';

class MakePaymentUseCase {
  final CheckoutRepository checkoutRepository;

  MakePaymentUseCase({required this.checkoutRepository});

  Future<void> call({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async =>
      await checkoutRepository.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
}
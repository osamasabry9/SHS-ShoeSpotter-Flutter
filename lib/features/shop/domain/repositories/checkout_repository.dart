import '../../data/models/stripe_models/payment_intent_input_model.dart';

abstract class CheckoutRepository {
  Future< void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}

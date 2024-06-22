import '../../domain/repositories/checkout_repository.dart';
import '../datasources/stripe_remote_data_source.dart';
import '../models/stripe_models/payment_intent_input_model.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final StripeRemoteDataSource stripeRemoteDataSource;

  CheckoutRepositoryImpl({required this.stripeRemoteDataSource});
  @override
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async =>
      stripeRemoteDataSource.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
}

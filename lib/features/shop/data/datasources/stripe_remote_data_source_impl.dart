import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/utils/constants/api_keys.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/app_constants.dart';
import '../models/stripe_models/ephemeral_key/ephemeral_key.dart';
import '../models/stripe_models/init_payment_sheet_input_model.dart';
import '../models/stripe_models/payment_intent_input_model.dart';
import '../models/stripe_models/payment_intent_model/payment_intent_model.dart';
import 'stripe_remote_data_source.dart';

class StripeRemoteDataSourceImpl implements StripeRemoteDataSource {
  final ApiService apiService = ApiService();

  @override
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await apiService.post(
      url: AppConstants.paymentIntentsUrl,
      body: paymentIntentInputModel.toJson(),
      token: AppKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  @override
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      url: AppConstants.ephemeralKeyUrl,
      body: {'customer': customerId},
      token: AppKeys.secretKey,
      header: {
        'Authorization': 'Bearer ${AppKeys.secretKey}',
        'Stripe-Version': '2023-10-16',
      },
      contentType: Headers.formUrlEncodedContentType,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  @override
  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Shoe Spotter',
      ),
    );
  }

  @override
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  @override
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      var paymentIntentModel = await createPaymentIntent(
          paymentIntentInputModel: paymentIntentInputModel);
      var ephemeralKeyModel = await createEphemeralKey(
          customerId: paymentIntentInputModel.customerId);
      InitPaymentSheetInputModel initPaymentSheetInputModel =
          InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        ephemeralKey: ephemeralKeyModel.secret!,
        customerId: AppKeys.customerId,
      );
      await initPaymentSheet(
          initPaymentSheetInputModel: initPaymentSheetInputModel);
      await displayPaymentSheet();
    } catch (e) {
      throw 'Something went wrong while making payment. please try again.';
    }
  }
}

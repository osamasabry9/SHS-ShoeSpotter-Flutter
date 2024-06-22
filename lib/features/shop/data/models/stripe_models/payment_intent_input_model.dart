class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  Map<String, dynamic> toJson() => {
        'amount': (int.parse(amount) * 100).toString(),
        'currency': currency,
        'customer': customerId
        // 'receipt_email': customerEmail
        // 'customer_name': customerName
      };
}

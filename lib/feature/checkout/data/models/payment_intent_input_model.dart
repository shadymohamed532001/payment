class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    // Parse the amount string to double, multiply by 100, and then convert back to string
    final int multipliedAmount = (double.parse(amount) * 100).toInt();

    return {
      "amount": multipliedAmount.toString(),
      "currency": currency,
    };
  }
}

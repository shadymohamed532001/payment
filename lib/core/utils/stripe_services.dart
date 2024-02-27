import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_key.dart';
import 'package:payment/core/utils/api_services.dart';
import 'package:payment/feature/checkout/data/models/ephemeral_key_model.dart';
import 'package:payment/feature/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/feature/checkout/data/models/payment_intent_model.dart';

class StripeServices {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createpaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var result = PaymentIntentModel.fromJson(response.data);
    return result;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputMode initPaymentSheetInputMode}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentSheetInputMode.paymentIntentClientSecret,
        merchantDisplayName: 'shixxx',
        customerEphemeralKeySecret: initPaymentSheetInputMode.ephemeralKey,
        customerId: initPaymentSheetInputMode.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createpaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);

    var ephemeralkeyModel =
        await createephemeralKey(custmerId: paymentIntentInputModel.customerId);

    var inputModel = InitPaymentSheetInputMode(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKey: ephemeralkeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputMode: inputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralkeyModel> createephemeralKey({required custmerId}) async {
    var response = await apiService.post(
      body: {'customer': custmerId},
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-10-16'
      },
      token: ApiKeys.secretKey,
    );
    var result = EphemeralkeyModel.fromJson(response.data);
    return result;
  }
}

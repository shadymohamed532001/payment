import 'package:dartz/dartz.dart';
import 'package:payment/core/error/server_falier.dart';
import 'package:payment/core/utils/stripe_services.dart';
import 'package:payment/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/feature/checkout/data/repo/checkout_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Falier, void>> makePayment(
      PaymentIntentInputModel inputModel) async {
    try {
      await stripeServices.makePayment(paymentIntentInputModel: inputModel);
      return right(null);
    } catch (e) {
      return left(ServerError(e.toString()));
    }
  }
}

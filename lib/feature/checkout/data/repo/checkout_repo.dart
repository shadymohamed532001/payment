import 'package:dartz/dartz.dart';
import 'package:payment/core/error/server_falier.dart';
import 'package:payment/feature/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Falier, void>> makePayment(
    PaymentIntentInputModel inputModel,
  );
}

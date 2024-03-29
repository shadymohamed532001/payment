import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/feature/checkout/data/repo/checkout_repo.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.checkOutRepo) : super(CheckOutInitial());
  final CheckOutRepo checkOutRepo;
  Future makepayment(PaymentIntentInputModel paymentIntentInputModel) async {
    emit(CheckOutLoading());

    var response = await checkOutRepo.makePayment(paymentIntentInputModel);

    response.fold((falier) {
      emit(CheckOutError(falier.error.toUpperCase()));
    }, (sucsses) {
      emit(CheckOutSuccess());
    });
  }
}

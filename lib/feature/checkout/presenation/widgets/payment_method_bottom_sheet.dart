import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/widgets/app_bottom.dart';
import 'package:payment/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/feature/checkout/logic/cubit/check_out_cubit.dart';
import 'package:payment/feature/checkout/presenation/views/thank_you_view.dart';
import 'package:payment/feature/checkout/presenation/widgets/pay_ment_method_list_view.dart';

class PayMentMethodBottomSheet extends StatelessWidget {
  const PayMentMethodBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 50, bottom: 20),
            child: PayMentMethodListView(),
          ),
          CustomBottomSheetConsummer()
        ],
      ),
    );
  }
}

class CustomBottomSheetConsummer extends StatelessWidget {
  const CustomBottomSheetConsummer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        if (state is CheckOutSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is CheckOutError) {
          print(state.error.toString());
          // Handle the error, such as displaying an error message
        }
      },
      builder: (context, state) {
        return CustomBottom(
          isLoading: state is CheckOutLoading ? true : false,
          backgroundColor: Colors.green,
          onPressed: () {
            PaymentIntentInputModel paymentIntentInput =
                PaymentIntentInputModel(amount: '100', currency: 'USD');
            BlocProvider.of<CheckOutCubit>(context)
                .makepayment(paymentIntentInput);
          },
          bottomtext: 'pay',
        );
      },
    );
  }
}

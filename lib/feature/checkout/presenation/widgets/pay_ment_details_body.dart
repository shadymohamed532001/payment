import 'package:flutter/material.dart';
import 'package:payment/feature/checkout/presenation/widgets/custom_creadite_card.dart';
import 'package:payment/feature/checkout/presenation/widgets/pay_ment_method_list_view.dart';

class PayMentDetailsBody extends StatelessWidget {
  const PayMentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PayMentMethodListView(),
        CustomCreaditeCard(),
      ],
    );
  }
}

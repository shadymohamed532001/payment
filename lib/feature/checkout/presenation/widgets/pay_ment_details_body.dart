import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/core/widgets/app_bottom.dart';
import 'package:payment/feature/checkout/presenation/views/thank_you_view.dart';
import 'package:payment/feature/checkout/presenation/widgets/custom_creadite_card.dart';
import 'package:payment/feature/checkout/presenation/widgets/pay_ment_method_list_view.dart';

class PayMentDetailsBody extends StatefulWidget {
  const PayMentDetailsBody({super.key});

  @override
  State<PayMentDetailsBody> createState() => _PayMentDetailsBodyState();
}

class _PayMentDetailsBodyState extends State<PayMentDetailsBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: PayMentMethodListView(),
      ),
      SliverToBoxAdapter(
        child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        ),
      ),
      SliverFillRemaining(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: CustomBottom(
                bottomtext: 'Credit Card',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('save payment');
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ThankYouView();
                    }));
                  }
                },
                backgroundColor: Colors.green,
              ),
            )),
      )
    ]);
  }
}

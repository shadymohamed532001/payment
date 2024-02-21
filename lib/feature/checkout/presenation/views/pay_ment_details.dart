import 'package:flutter/material.dart';
import 'package:payment/feature/checkout/presenation/widgets/pay_ment_details_body.dart';

class PayMentDetails extends StatelessWidget {
  const PayMentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
        title: const Text(
          'Payment Details',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: const PayMentDetailsBody(),
    );
  }
}

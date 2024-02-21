import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreaditeCard extends StatefulWidget {
  const CustomCreaditeCard({super.key});

  @override
  State<CustomCreaditeCard> createState() => _CustomCreaditeCardState();
}

class _CustomCreaditeCardState extends State<CustomCreaditeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: '',
          expiryDate: '',
          cardHolderName: '',
          cvvCode: '',
          showBackView: true,
          onCreditCardWidgetChange:
              (value) {}, //true when you want to show cvv(back) view
        ),
      ],
    );
  }
}

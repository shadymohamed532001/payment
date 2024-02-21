import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({Key? key}) : super(key: key);

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String? cardNumber = '';
  String? expiryDate = '';
  String? cardHolderName = '';
  String? cvvCode = '';
  bool? showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber!,
          expiryDate: expiryDate!,
          cardHolderName: cardHolderName!,
          cvvCode: cvvCode!,
          showBackView: showBackView!,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {
            //true when you want to show cvv(back) view
          },
        ),
        CreditCardForm(
          cardNumber: cardNumber!,
          expiryDate: expiryDate!,
          cardHolderName: cardHolderName!,
          cvvCode: cvvCode!,
          onCreditCardModelChange: (creadcardmodel) {
            cardNumber = creadcardmodel.cardNumber;
            expiryDate = creadcardmodel.expiryDate;
            cardHolderName = creadcardmodel.cardHolderName;
            cvvCode = creadcardmodel.cvvCode;
            showBackView = creadcardmodel.isCvvFocused;
            setState(() {});
          },
          formKey: formKey,
        )
      ],
    );
  }
}

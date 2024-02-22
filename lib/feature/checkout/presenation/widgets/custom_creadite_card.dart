import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {Key? key, required this.formKey, required this.autovalidateMode})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String? cardNumber = '';
  String? expiryDate = '';
  String? cardHolderName = '';
  String? cvvCode = '';
  bool? showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardBgColor: Colors.black,
          bankName: 'CIB',
          cardNumber: cardNumber!,
          expiryDate: expiryDate!,
          cardHolderName: cardHolderName!,
          cvvCode: cvvCode!,
          customCardTypeIcons: <CustomCardTypeIcon>[
            CustomCardTypeIcon(
              cardType: CardType.mastercard,
              cardImage: Image.asset(
                'assets/images/mastercard.png',
                height: 48,
                width: 48,
              ),
            ),
          ],
          showBackView: showBackView!,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {
            //true when you want to show cvv(back) view
          },
        ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
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
          formKey: widget.formKey,
        )
      ],
    );
  }
}

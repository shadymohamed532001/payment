import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:payment/feature/checkout/presenation/widgets/my_card_view_body.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckout(
                  sandboxMode: true,
                  clientId:
                      "ATAKTP0iwZP0wX_LB1FVZsP8orYZWHb7UhX2JBNW876Hx2ksbOFk04ndX1BsJy1ZRNHKt0CMmWiASedR",
                  secretKey:
                      "EOeLJ2ZjsGE3Cvfd7xZ-WdGTgAzTv1gbzOWLa0MvjFoUMAd6bsnJPn_hMlKwdn7AjpY_umecbKRP1lEd",
                  returnURL: "success.snippetcoder.com",
                  cancelURL: "cancel.snippetcoder.com",
                  transactions: const [
                    {
                      "amount": {
                        "total": '70',
                        "currency": "USD",
                        "details": {
                          "subtotal": '70',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method":
                      //       "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '5',
                            "currency": "USD"
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '10',
                            "currency": "USD"
                          }
                        ],

                        // shipping address is not required though
                        //   "shipping_address": {
                        //     "recipient_name": "Raman Singh",
                        //     "line1": "Delhi",
                        //     "line2": "",
                        //     "city": "Delhi",
                        //     "country_code": "IN",
                        //     "postal_code": "11001",
                        //     "phone": "+00000000",
                        //     "state": "Texas"
                        //  },
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    print("onSuccess: $params");
                  },
                  onError: (error) {
                    print("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                  },
                ),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),
        title: const Text(
          'My Card',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: const MyCardViewBody(),
    );
  }
}

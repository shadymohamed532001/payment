import 'package:flutter/material.dart';
import 'package:payment/core/widgets/app_bottom.dart';
import 'package:payment/feature/checkout/presenation/widgets/card_Info_item.dart';
import 'package:payment/feature/checkout/presenation/widgets/pay_ment_method_list_view.dart';
import 'package:payment/feature/checkout/presenation/widgets/total_price_info.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/Group 6.png',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const CardInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(
            height: 5,
          ),
          const CardInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 5,
          ),
          const CardInfoItem(
            title: 'Shipping',
            value: '\$8.97',
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 34,
          ),
          const TotalPrice(
            title: 'Total',
            value: '\$50.97',
          ),
          const SizedBox(
            height: 50,
          ),
          CustomBottom(
            bottomHeight: 60,
            bottomtext: 'Complete Payment',
            backgroundColor: const Color(0xff34A853),
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  context: context,
                  builder: (context) {
                    return const PayMentMethodBottomSheet();
                  });
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class PayMentMethodBottomSheet extends StatelessWidget {
  const PayMentMethodBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 50, bottom: 20),
            child: PayMentMethodListView(),
          ),
          CustomBottom(
            backgroundColor: Colors.green,
            onPressed: () {},
            bottomtext: 'pay',
          )
        ],
      ),
    );
  }
}

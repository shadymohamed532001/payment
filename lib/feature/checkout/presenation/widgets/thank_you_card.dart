import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/widgets/app_bottom.dart';
import 'package:payment/feature/checkout/presenation/widgets/master_card_Info_widget.dart';
import 'package:payment/feature/checkout/presenation/widgets/thank_you_item.dart';
import 'package:payment/feature/checkout/presenation/widgets/total_price_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 50 + 16, left: 22, right: 22, bottom: 16),
        child: Column(
          children: [
            const Text(
              'Thank you',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Your transaction was successful',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            const ThankYouItem(
              title: 'date',
              value: '5/3/2024',
            ),
            const SizedBox(
              height: 20,
            ),
            const ThankYouItem(
              title: 'time',
              value: '10:33 AM',
            ),
            const SizedBox(
              height: 20,
            ),
            const ThankYouItem(
              title: 'To',
              value: 'shady steha',
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            const TotalPrice(
              title: 'Total',
              value: '\$ 500.3 ',
            ),
            const SizedBox(
              height: 30,
            ),
            const MasterCardInfoWidget(),
            const Spacer(
              flex: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/barcode.png',
                    width: 160,
                    height: 90,
                  ),
                ),
                CustomBottom(
                  bottomHeight: 60,
                  bottomWidth: 120,
                  onPressed: () {},
                  bottomtext: 'Pay',
                  textBottomStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

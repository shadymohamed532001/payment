import 'package:flutter/material.dart';
import 'package:payment/feature/checkout/presenation/widgets/custom_check_icon.dart';
import 'package:payment/feature/checkout/presenation/widgets/custom_dashed_line.dart';
import 'package:payment/feature/checkout/presenation/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 100,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            right: 20 + 8,
            left: 20 + 8,
            top: MediaQuery.of(context).size.height * .55 +
                20, // 20 is the radius of the circle avatar
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            top: MediaQuery.of(context).size.height * .55,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            top: MediaQuery.of(context).size.height * .55,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}

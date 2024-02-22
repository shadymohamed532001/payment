import 'package:flutter/material.dart';
import 'package:payment/feature/checkout/presenation/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

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
      ),
      body: Transform.translate(
        offset: const Offset(0, -5), // offset of the body TO MOVE IT INTO TOP
        child: const ThankYouViewBody(),
      ),
    );
  }
}

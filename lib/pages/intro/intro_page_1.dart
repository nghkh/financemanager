import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('Skip'),
            )
          ],
        ),
        Image.asset(
          'assets/intro_1.png',
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        Text(
          'Double your financial capacity',
          style: AppTextStyle.textStyle4Black,
          textAlign: TextAlign.left,
        ),
        const Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'We inject saving habits to the current system by creating easy and fair saving plans that would be favorable to our customers.',
              style: AppTextStyle.textStyle3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

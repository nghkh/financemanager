import 'package:baitap/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Skip'),
              )
            ],
          ),
        ),
        Image.asset(
          'assets/intro_2.png',
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        Text(
          'Start saving for a better tomorrow',
          style: AppTextStyle.textStyle4Black,
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Use Cloud Cooperative to plan towards your dream home, kid’s education and travel the world.',
              style: AppTextStyle.textStyle3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

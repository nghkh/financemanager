import 'package:baitap/constant/text_style.dart';
import 'package:baitap/pages/intro/controller/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  IntroController get controller => Get.put<IntroController>(IntroController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Onboarding(
          pages: controller.onboardingPagesList,
          onPageChange: (int pageIndex) {
            controller.index.value = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIndicator(
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                    indicator: Indicator(
                      indicatorDesign: IndicatorDesign.line(
                        lineDesign: LineDesign(
                          lineType: DesignType.line_uniform,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  controller.index.value == pagesLength - 1
                      ? getStartButtib(setIndex: setIndex)
                      : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Material getStartButtib({void Function(int)? setIndex}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (setIndex != null) {
            controller.index.value = 1;
            setIndex(1);
          }
          Get.toNamed('/signup');
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Get Started',
            style: AppTextStyle.textStyle1,
          ),
        ),
      ),
    );
  }

}

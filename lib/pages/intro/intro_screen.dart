import 'package:baitap/constant/text_style.dart';
import 'package:baitap/pages/intro/intro_page_1.dart';
import 'package:baitap/pages/intro/intro_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: const IntroPage1(),
    ),
    PageModel(
      widget: const IntroPage2(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Onboarding(
            pages: onboardingPagesList,
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(height: 32,),
                    index == pagesLength - 1
                        ? _getStartButtib(setIndex: setIndex)
                        : SizedBox(),
                  ],
                ),
              );
            },
          ),
        ),
      );
  }


  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (setIndex != null) {
            index = 1;
            setIndex(1);
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Skip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Material _getStartButtib({void Function(int)? setIndex}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (setIndex != null) {
            index = 1;
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

  Material _arrowbutton({void Function(int)? setIndex}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (() {
          if (setIndex != null) {
            setIndex(index + 1);
          }
        }),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            color: Colors.black,
            Icons.arrow_forward,
            size: 32,
          ),
        ),
      ),
    );
  }

}

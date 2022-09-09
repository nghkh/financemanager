import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

// void main() {
//   runApp(const MyApp());
// }

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    //page1
    PageModel(
      widget: SizedBox(
        height: 1000,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              width: 0.0,
              color: background,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: background,
                  ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  child: Image.network(
                    '',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Double your financial capacity',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'We inject saving habits to the current system by creating easy and fair saving plans that would be favorable to our customers.',
                      style: pageInfoStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    //page2
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: background,
                ),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.network(
                  '',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Start saving for a better tomorrow',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Use Cloud Cooperative to plan towards your dream home, kid’s education and travel the world.',
                    style: pageInfoStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
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
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
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
            color: Colors.white,
            Icons.arrow_forward,
            size: 32,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Onboarding(
            pages: onboardingPagesList,
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(
                    width: 0.0,
                    color: background,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ColoredBox(
                    color: background,
                    child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          index == pagesLength - 1
                              ? _getStartButtib(setIndex: setIndex)
                              : _arrowbutton(setIndex: setIndex)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

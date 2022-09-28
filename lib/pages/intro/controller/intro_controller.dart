import 'package:baitap/pages/intro/intro_page_1.dart';
import 'package:baitap/pages/intro/intro_page_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

class IntroController extends GetxController {
  late Material materialButton;
  late RxInt index = 0.obs;
  final onboardingPagesList = [
    PageModel(
      widget: const IntroPage1(),
    ),
    PageModel(
      widget: const IntroPage2(),
    ),
  ];


}
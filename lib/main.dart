import 'package:baitap/model/controller_signup.dart';
import 'package:baitap/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/sign_up_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/loginPage',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/SignUpPage',
          page: () => SignUpPage(),
          binding: SignUpBinding(),
        ),
      ],
    ),
  );
}

import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:baitap/pages/check.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/',
          page: () => SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/check',
          page: () => Check(),
        ),
      ],
    ),
  );
}

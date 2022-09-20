import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:baitap/pages/check.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/overview_pages/controller/tab_controller.dart';
import 'package:baitap/pages/overview_pages/overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(

      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/check',
          page: () => Check(),
        ),
        GetPage(
          name: '/',
          page: () => Overview(),
          binding: TabBinding(),
        ),
      ],
    ),
  );
}

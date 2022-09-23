import 'package:baitap/firebase/controller.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:baitap/pages/check.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/overview_pages/controller/tab_controller.dart';
import 'package:baitap/pages/overview_pages/overview.dart';
import 'package:baitap/pages/profile_basic_info.dart';
import 'package:baitap/pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';

import 'firebase/controller/firebase_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) => {
    Get.put(AuthController()),
  });
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primaryColor:
      Colors.green),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
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
          name: '/overview',
          page: () => Overview(),
          binding: TabBinding(),
        ),
        GetPage(
          name: '/profile_info',
          page: () => ProfileInfo(),
        ),
        GetPage(
          name: '/profile_page',
          page: (() => ProfilePage()),
        ),
      ],
    ),
  );
}


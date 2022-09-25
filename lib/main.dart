import 'package:baitap/firebase/controller.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:baitap/pages/intro/intro_screen.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/overview_pages/controller/tab_controller.dart';
import 'package:baitap/pages/overview_pages/overview.dart';
import 'package:baitap/pages/profile_basic_info.dart';
import 'package:baitap/pages/profile_page.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.green, opacity: 1),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpPage(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: '/',
          page: () => const IntroScreen(),
        ),
        GetPage(
          name: '/overview',
          page: () => const Overview(),
          binding: TabBinding(),
        ),
        GetPage(
          name: '/profile_info',
          page: () => const ProfileInfo(),
        ),
        GetPage(
          name: '/profile_page',
          page: (() => const ProfilePage()),
        ),
      ],
    ),
  );
}

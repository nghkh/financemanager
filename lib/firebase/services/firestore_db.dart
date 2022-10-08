import 'dart:convert';

import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:baitap/pages/intro/intro_screen.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/overview_pages/controller/tab_controller.dart';
import 'package:baitap/pages/overview_pages/overview.dart';
import 'package:baitap/pages/profile_page/profile_basic_info.dart';
import 'package:baitap/pages/profile_page/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';

int? initScreen;
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // initScreen = await preferences.getInt('initScreen');
  // await preferences.setInt('initScreen', 1);
  await firebaseInitialization.then((value) => {
        Get.put(AuthController()),
      });
  await FirebaseFirestore.instance.collection('ChiTieuThang').get().then(
        (snapshot) => snapshot.docs.forEach(
          (doc) => print(jsonEncode(doc.data())),
        ),
      );
}

import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/firebase/controller/chitieuthang_controller.dart';
import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:baitap/firebase/routes.dart/app_routes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'firebase/controller/firebase_constant.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  await firebaseInitialization.then((value) => {
        Get.put(AuthController()),
      });

  await FirebaseFirestore.instance.collection('users').get().then(
        (snapshot) => snapshot.docs.forEach(
          (doc) => print('kết quả là ${doc.data()}'),
        ),
      );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[400],
        iconTheme: const IconThemeData(color: Colors.green, opacity: 1),
        scaffoldBackgroundColor: const Color.fromARGB(255, 248, 250, 252),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? '/intro' : '/',
      getPages: AppRoutes.routes(),
    ),
  );
}

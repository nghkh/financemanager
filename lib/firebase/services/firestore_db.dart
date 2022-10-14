import 'dart:convert';

import 'package:baitap/firebase/controller/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

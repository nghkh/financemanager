import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:baitap/pages/transcations_page/controller/transcation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login_signup/controller/controller_login.dart';



class NameProfileController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController fillEmail = TextEditingController();
  TextEditingController fillPhone = TextEditingController();
  TextEditingController fillBalance = TextEditingController();
  var listGenders = <DropdownMenuItem<String>>[].obs;
  var selectedValue = 'male'.obs;

  @override
  void onInit() {
    listGenders.addAll(<DropdownMenuItem<String>>[
      const DropdownMenuItem(value: "male", child: Text("Nam")),
      const DropdownMenuItem(value: "female", child: Text("Nữ")),
    ]);
    // TODO: implement onInit
    super.onInit();
  }

  void onChanged(value) {
    selectedValue.value = value;
  }
}

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NameProfileController>(() => NameProfileController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<TranscationsPageController>(() => TranscationsPageController());
    // TODO: implement dependencies
  }
}


import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class ShowPasswords extends GetxController{

  RxBool obscureText = true.obs;
  void changeState() {
    obscureText.value = !obscureText.value;
  }
}


class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowPasswords());
    Get.lazyPut<EmailPassController>(() => EmailPassController());
    // TODO: implement dependencies
  }


}
import 'package:baitap/firebase/controller.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckBoxLoginController extends GetxController {

  RxBool checkBoxVal = false.obs;
  void onChanged (bool val){
    checkBoxVal.value = val;
    }
}

class EmailPassController extends GetxController {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();
}

class LoginButtonController extends GetxController{

}
class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPasswords>(() => ShowPasswords());
    Get.lazyPut<CheckBoxLoginController>(() => CheckBoxLoginController());
    Get.lazyPut<EmailPassController>(() => EmailPassController());
    Get.lazyPut<LoginButtonController>(() => LoginButtonController());
    // Get.lazyPut(() => AuthController());
    // TODO: implement dependencies
  }
}
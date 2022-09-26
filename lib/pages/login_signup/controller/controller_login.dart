import 'package:baitap/firebase/controller.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );
      // credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      // Get.toNamed('/overview');
    }
  }

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
    Get.lazyPut(() => AuthController());
    // TODO: implement dependencies
  }
}
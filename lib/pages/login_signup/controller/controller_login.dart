import 'package:baitap/Widget/button.dart';
import 'package:baitap/Widget/dialogs.dart';
import 'package:baitap/firebase/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/pages/login_signup/controller/controller_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckBoxLoginController extends GetxController {
  RxBool checkBoxVal = false.obs;

  void onChanged(bool val) {
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
      Get.offAndToNamed('/overview');
      // credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.dialog(
          AppAlertDialog(
            title: 'LỖI',
            content: 'Không tìm thấy người dùng, vui lòng thử lại',
            textButton: 'ĐÓNG',
            onPressed: () => Get.back(),
          ),
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.dialog(
          AppAlertDialog(
            title: 'LỖI',
            content: 'Mật khẩu không trùng với thông tin đăng ký',
            textButton: 'ĐÓNG',
            onPressed: () => Get.back(),
          ),
        );
      }
      // Get.toNamed('/overview');
    }
  }

  void register() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      Get.dialog(
        AppAlertDialog(
          title: 'LỖI',
          content: 'Mật khẩu không trùng với thông tin đăng ký',
          textButton: 'ĐÓNG',
          onPressed: () => Get.back(),
        ),
      );
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }
}

class LoginButtonController extends GetxController {}

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

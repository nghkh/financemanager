import 'package:baitap/Widget/dialogs.dart';
import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/model/users.dart';
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

class AppAuthController extends GetxController {
  final allUser = <UserModel>[].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Rx<Map<String, dynamic>> db;
  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAndToNamed('/overview');
      var showUid = auth.currentUser!.uid;
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
    Get.offAndToNamed('/overview');
  }

  void register() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim()).then((result) {
            String _userId = result.user!.uid;
            firestore.collection('users').doc(_userId).set({
              'email': emailController.text,
            });
          });

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

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed('/login');
  }

}

class LoginButtonController extends GetxController {}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPasswords>(() => ShowPasswords());
    Get.lazyPut<CheckBoxLoginController>(() => CheckBoxLoginController());
    Get.lazyPut<AppAuthController>(() => AppAuthController());
    Get.lazyPut<LoginButtonController>(() => LoginButtonController());
    Get.lazyPut(() => AuthController());
    // TODO: implement dependencies
  }
}

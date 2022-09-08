import 'package:get/get.dart';

class CheckPasswords extends GetxController {
}

class CheckEmail extends GetxController {
  // var email = "tony@starkindustries.com".obs;
  void checkEmailvalid(RxString email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.value);
  }
}

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckPasswords());
    Get.lazyPut(() => CheckEmail());
    // TODO: implement dependencies
  }


}
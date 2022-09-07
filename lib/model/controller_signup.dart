import 'package:get/get.dart';

class CheckPasswords extends GetxController {}

class CheckEmail extends GetxController {}

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckPasswords());
    Get.lazyPut(() => CheckEmail());
    // TODO: implement dependencies
  }


}
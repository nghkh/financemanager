import 'package:baitap/model/controller_signup.dart';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  RxBool checkBoxVal = false.obs;
  void onChanged (bool val){
    checkBoxVal.value = val;
    }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowPasswords());
    Get.lazyPut(() => CheckBoxController());
    // TODO: implement dependencies
  }
}
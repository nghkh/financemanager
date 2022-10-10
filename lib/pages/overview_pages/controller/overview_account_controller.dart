import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:get/get.dart';

class AccountController extends GetxController{

}

class AccountPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppAuthController>(() => AppAuthController());
  }
}
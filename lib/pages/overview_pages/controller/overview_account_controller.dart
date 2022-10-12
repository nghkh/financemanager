import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:get/get.dart';

class AccountController extends GetxController{
var dataFirstName = ''.obs;
var dataLastName = ''.obs;
var dataGender = ''.obs;
var dataDoB = ''.obs;
var phoneNumber = ''.obs;
var dataEmail = ''.obs;

@override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }

}

class AccountPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppAuthController>(() => AppAuthController());
  }
}
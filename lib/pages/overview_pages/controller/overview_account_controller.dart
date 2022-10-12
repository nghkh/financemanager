import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:baitap/model/users.dart';
import 'package:baitap/pages/login_signup/controller/controller_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  Rx<UserModel> userModel = UserModel(
          id: '1',
          email: '1',
          sdu: '1',
          firstName: '1',
          lastName: '1',
          gender: '1',
          sdt: '1',
          dob: '1')
      .obs;

  @override
  void onReady() {
    userModel.bindStream(lista());
    // TODO: implement onReady
    super.onReady();
  }

  Stream<UserModel> lista() {
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
        firestore.collection('users').doc(auth.currentUser!.uid.toString()).snapshots();
    return stream.map((event) => UserModel.fromDocument(event));
  }

}

class AccountPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppAuthController>(() => AppAuthController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => AccountController());
  }
}

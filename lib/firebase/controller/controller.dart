import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
  }
}
// ever(firebaseUser, _setInitialScreen);

// _setInitialScreen(User? user) {
//   if (user != null) {
//     // user is logged in
//     Get.offAll(() => const SignUpPage());
//   } else {
//     // user is null as in user is not available or not logged in
//     Get.to(() => LoginPage());
//   }
// }

void signOut() {
  try {
    auth.signOut();
  } catch (e) {
    print(e.toString());
  }
}

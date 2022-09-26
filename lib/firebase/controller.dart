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

    // ever(firebaseUser, _setInitialScreen);
  }

  // _setInitialScreen(User? user) {
  //   if (user != null) {
  //     // user is logged in
  //     Get.offAll(() => const SignUpPage());
  //   } else {
  //     // user is null as in user is not available or not logged in
  //     Get.to(() => LoginPage());
  //   }
  // }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
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

  void login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
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

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

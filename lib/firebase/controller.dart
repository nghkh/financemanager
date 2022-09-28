<<<<<<< HEAD
// import 'package:baitap/generated_plugin_registrant.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
=======
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
>>>>>>> e2156da47d37078ead64aa66b83bb43b69ba307c

// class AuthController extends GetxController {
//   static AuthController authInstance = Get.find();
//   late Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     super.onReady();
//     firebaseUser = Rx<User?>(auth.currentUser);
//     firebaseUser.bindStream(auth.userChanges());

<<<<<<< HEAD
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     if (user != null) {
//       // user is logged in
//       Get.offAll(() => const Home());
//     } else {
//       // user is null as in user is not available or not logged in
//       Get.offAll(() => Login());
//     }
//   }

//   void register(String email, String password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       // this is solely for the Firebase Auth Exception
//       // for example : password did not match
//       print(e.message);
//       // Get.snackbar("Error", e.message!);
//       Get.snackbar(
//         "Error",
//         e.message!,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } catch (e) {
//       // this is temporary. you can handle different kinds of activities
//       //such as dialogue to indicate what's wrong
//       print(e.toString());
//     }
//   }

//   void login(String email, String password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       // this is solely for the Firebase Auth Exception
//       // for example : password did not match
//       print(e.message);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   void signOut() {
//     try {
//       auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
=======
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





  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
>>>>>>> e2156da47d37078ead64aa66b83bb43b69ba307c

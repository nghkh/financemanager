// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:cadevo/constants/firebase.dart';

// class AuthController extends GetxController {
//   static AuthController instance = Get.find();
//   RxBool isLoggedIn = false.obs;
//   Rx<User> firebaseUser;
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   String userCollection = "users";
//   @override
//   void onReady() {
//     super.onReady();
//     _setInitinalScreen();
//     firebaseUser = Rx<User>(auth.currentUser);
//     firebaseUser.bindStream(auth.userChanges());
//     ever(firebaseUser, _setInitinalScreen);
//   }

//   _setInitinalScreen(User user) {
//     if (user != null) {
//       isLoggedIn.value = true;
//       Get.offAll(() => Home());
//     } else {
//       isLoggedIn.value = false;
//       Get.offAll(() => Login());
//     }
//   }

//   void register(String email, String password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseFirestore.collection(userCollection).doc(_userId).set({
//         "name": name.text,
//         "email": email,
//         "password": password,
//       });
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
//     auth.signOut();
//   }
// }

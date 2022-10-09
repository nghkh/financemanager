import 'dart:convert';

import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/firebase/controller/chitieuthang_controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/model/chi_tieu.dart';
import 'package:baitap/model/chi_tieu_thang.dart';
import 'package:baitap/pages/login_signup/login_page.dart';
import 'package:baitap/pages/login_signup/sign_up_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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


void signOut() {
  try {
    auth.signOut();
  } catch (e) {
    print(e.toString());
  }
}

//Controller cho man addtransaction
String timetoDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}

String timetoMonth(DateTime date) {
  return '${date.month}/${date.year}';
}

String timetoYear(DateTime date) {
  return '${date.year}';
}

class addTransactionController extends GetxController {
  final allchiTieu = <ChiTieu>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  late ChiTieu chiTieuModel;
  late ChiTieuThang chiTieuThangmodel;
  Future<void> set(String chiphi, String loai) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      ChiTieuController chiTieuController = Get.find<ChiTieuController>();
      // ChiTieuController chiTieuController = Get.put(ChiTieuController());
      final id = '${chiTieuController.allchiTieu.value.length + 1}';
      print('id: $id');
      print(chiTieuController.allchiTieu.length);
      final User? user = auth.currentUser;
      final String iduser = user?.uid.toString() ?? "";
      try {
        await chiTieuController.setChiTieu(
          ChiTieu(
              id: id,
              iduser: iduser,
              idthang: timetoMonth(DateTime.now()),
              loai: loai,
              chiphi: chiphi,
              ngaythang: timetoDate(DateTime.now())),
        );
      } catch (e) {
        print(e);
      }
      //tongchiphi= tong chitieu trong thang
      ChiTieuThangController _chiTieuThangController =
          Get.put(ChiTieuThangController());
      var tong = 0;
      String tongchiphi = chiTieuController.allchiTieu
          .where((element) => element.iduser == iduser)
          .where((element) => element.idthang == timetoMonth(DateTime.now()))
          .map((e) => {tong + int.parse(e.chiphi)})
          .toString();
      _chiTieuThangController.setChiTieuThang(ChiTieuThang(
          tongchiphi: tongchiphi,
          thang: timetoMonth(DateTime.now()),
          id: '$iduser${timetoMonth(DateTime.now())}',
          iduser: iduser));
      print(tongchiphi);
    } catch (e) {
      print(e);
    }
  }
}

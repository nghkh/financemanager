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

String timetoMonthRemoveSlah(DateTime date) {
  return '${date.month}${date.year}';
}

class addTransactionController extends GetxController {
  ChiTieuController chiTieuController = Get.find<ChiTieuController>();

  @override
  void onReady() {
    set(chiphi, loai);
    super.onReady();
  }

  late String chiphi;
  late String loai;
  late ChiTieu chiTieuModel;
  late ChiTieuThang chiTieuThangmodel;
  Future<void> set(String chiphi, String loai) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await firebaseInitialization.then((value) => {
            Get.put(ChiTieuController()),
          });
      await chiTieuController.addChiTieu();
      String id = '${chiTieuController.allchiTieu.length + 1}';
      final User? user = auth.currentUser;
      final String iduser = user?.uid.toString() ?? "1";

      //set cho chi tieu
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
          await Get.put(ChiTieuThangController());
      var tong = 0;
      await chiTieuController.addChiTieu();
      var a = chiTieuController.allchiTieu
          .where((element) => element.iduser == iduser)
          .where((element) => element.idthang == timetoMonth(DateTime.now()))
          .map((e) => tong = tong + int.parse(e.chiphi));
      print(a);
      String tongchiphi = tong.toString();
      print(tongchiphi.toString());
      var idChiTieuThang = iduser + timetoMonthRemoveSlah(DateTime.now());
      print(idChiTieuThang);
      _chiTieuThangController.setChiTieuThang(
        ChiTieuThang(
            id: idChiTieuThang,
            tongchiphi: tongchiphi,
            thang: timetoMonth(DateTime.now()),
            iduser: iduser),
      );
    } catch (e) {
      print(e);
    }
  }
}

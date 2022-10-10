import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/firebase/controller/users_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/chi_tieu_thang.dart';
import '../../model/users.dart';

class ChiTieuThangController extends GetxController {
  final allChiTieuThang = <ChiTieuThang>[].obs;
  @override
  void onReady() {
    addChiTieuThang();
    setChiTieuThang(chiTieuThangModel);
    deleteChiTieuThang(chiTieuThangModel);
    updateChiTieuThang(chiTieuThangModel);
    tinhSodu();
    super.onReady();
  }

  Future<void> addChiTieuThang() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('ChiTieuThang').get();
      final chitieuthangList =
          querySnapshot.docs.map((e) => ChiTieuThang.fromSnapshot(e)).toList();

      allChiTieuThang.assignAll(chitieuthangList);
    } catch (e) {
      print(e);
    }
  }

  late ChiTieuThang chiTieuThangModel;
  Future<void> setChiTieuThang(chiTieuThangModel) async {
    try {
      await firestore.collection('ChiTieuThang').doc(chiTieuThangModel.id).set({
        'iduser': chiTieuThangModel.iduser,
        'thang': chiTieuThangModel.thang,
        'tongchiphi': chiTieuThangModel.tongchiphi,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateChiTieuThang(chiTieuThangModel) async {
    try {
      await firestore
          .collection('ChiTieuThang')
          .doc(chiTieuThangModel.id)
          .update({
        'iduser': chiTieuThangModel.iduser,
        'thang': chiTieuThangModel.thang,
        'tongchiphi': chiTieuThangModel.tongchiphi,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteChiTieuThang(chiTieuThangModel) async {
    try {
      await firestore
          .collection('ChiTieuThang')
          .doc(chiTieuThangModel.id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  int soduconlai = 0.obs();
  Future<void> tinhSodu() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final user = auth.currentUser;
      final iduser = user?.uid.toString() ?? "1";
      String sdu = '';

      await firebaseInitialization.then((value) => {
            Get.put(UserController()),
          });
      UserController _userController = Get.find<UserController>();
      await _userController.addUser();
      UserModel _usersModel =
          _userController.allUser.firstWhere((element) => element.id == iduser);
      sdu = _usersModel.sdu;
      int sodu = int.parse(sdu);

      int tongchiphi = 0;
      await firestore
          .collection('ChiTieuThang')
          .where('iduser', isEqualTo: iduser)
          .where('thang', isEqualTo: timetoMonth(DateTime.now()))
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  tongchiphi = int.parse(doc['tongchiphi']);
                })
              });
      soduconlai = sodu - tongchiphi;
      print(soduconlai);
    } catch (e) {
      print(e);
    }
  }
}

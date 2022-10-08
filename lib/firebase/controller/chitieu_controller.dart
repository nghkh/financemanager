import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/chi_tieu.dart';

class ChiTieuController extends GetxController {
  final allchiTieu = <ChiTieu>[].obs;
  @override
  void onReady() async {
    await addChiTieu();
    await setChiTieu(chiTieuModel);
    super.onReady();
  }

  Future<void> addChiTieu() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('ChiTieu').get();

      final chitieuList =
          querySnapshot.docs.map((e) => ChiTieu.fromSnapshot(e)).toList();

      allchiTieu.assignAll(chitieuList);
    } catch (e) {
      print(e);
    }
  }

  late ChiTieu chiTieuModel;
  Future<void> setChiTieu(ChiTieu chiTieuModel) async {
    try {
      await firestore.collection('ChiTieu').doc(chiTieuModel.id).set({
        'ngaythang': chiTieuModel.ngaythang,
        'iduser': chiTieuModel.iduser,
        'idthang': chiTieuModel.idthang,
        'loai': chiTieuModel.loai,
        'chiphi': chiTieuModel.chiphi,
      });
    } catch (e) {
      print(e);
    }
  }
}

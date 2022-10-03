import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/chi_tieu.dart';

class ChiTieuController extends GetxController {
  final allchiTieu = <ChiTieu>[].obs;
  @override
  void onReady() {
    addChiTieu();
    super.onReady();
  }

  Future<void> addChiTieu() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('chitieu').get();
      final chitieuList =
          querySnapshot.docs.map((e) => ChiTieu.fromSnapshot(e)).toList();
      // final id = chitieuList.length + 1;
      // await firestore.collection('chitieu').doc(id.toString()).set({
      //   'id': id.toString(),
      //   'iduser': chitieu.iduser,
      //   'idthang': chitieu.idthang,
      //   'loai': chitieu.loai,
      //   'chiphi': chitieu.chiphi,
      // });
      allchiTieu.assignAll(chitieuList);
    } catch (e) {
      print(e);
    }
  }
}

import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/chi_tieu_thang.dart';

class ChiTieuThangController extends GetxController {
  final allChiTieuThang = <ChiTieuThang>[].obs;
  @override
  void onReady() {
    addChiTieuThang();
    setChiTieuThang(chiTieuThangModel);
    super.onReady();
  }

  Future<void> addChiTieuThang() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('ChiTieuThang').get();
      final chitieuthangList =
          querySnapshot.docs.map((e) => ChiTieuThang.fromSnapshot(e)).toList();
      print('chitieuthangList: $chitieuthangList');
      allChiTieuThang.assignAll(chitieuthangList);
      ;
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
        'loai': chiTieuThangModel.loai,
        'tongchiphi': chiTieuThangModel.tongchiphi,
      });
      print('abcxyz');
    } catch (e) {
      print(e);
    }
  }
}

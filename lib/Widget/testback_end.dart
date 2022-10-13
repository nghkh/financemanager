import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/firebase/controller/chitieuthang_controller.dart';
import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/model/chi_tieu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase/controller/users_controller.dart';

class TestBackEnd extends StatelessWidget {
  const TestBackEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChiTieuThangController _chitieuthangController = Get.find();

    return Obx(
      () => Center(
          child: Container(
              child:
                  Text(_chitieuthangController.soduconlai.value.toString()))),
    );
  }
}

class Testcard extends StatelessWidget {
  const Testcard({Key? key, required this.chitieumodel}) : super(key: key);
  final ChiTieu chitieumodel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chitieumodel.id),
      subtitle: Text(chitieumodel.iduser),
      trailing: Text(chitieumodel.chiphi),
    );
  }
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) => {
        Get.put(UserController()),
        Get.put(ChiTieuController()),
        Get.put(ChiTieuThangController()),
        Get.put(addTransactionController()),
      });
  UserController _userController = Get.find();
  ChiTieuController _chitieuController = Get.find();
  ChiTieuThangController _chiTieuThangController = Get.find();
  addTransactionController _addTransactionController = Get.find();
  // await _addTransactionController.set("100000", "3");

  await _chiTieuThangController.tinhSodu();
  // var a = _chiTieuThangController.soduconlai;
  // print('sodu: ${a}');
  // _chitieuController.setChiTieu(ChiTieu(
  //     id: '3',
  //     iduser: '1',
  //     idthang: '1',
  //     ngaythang: '1',
  //     loai: '1',
  //     chiphi: '1'));

  runApp(
    GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TestBackEnd'),
        ),
        body: TestBackEnd(),
      ),
    ),
  );
}

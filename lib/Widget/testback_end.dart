import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/model/chi_tieu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestBackEnd extends StatelessWidget {
  const TestBackEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChiTieuController _chitieuController = Get.find();
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: _chitieuController.allchiTieu.length,
        itemBuilder: (context, index) {
          print(_chitieuController.allchiTieu);
          return Testcard(chitieumodel: _chitieuController.allchiTieu[index]);
        },
      ),
    );
  }
}

class Testcard extends StatelessWidget {
  const Testcard({Key? key, required this.chitieumodel}) : super(key: key);
  final ChiTieu chitieumodel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('{$chitieumodel.id} 1'),
      subtitle: Text(chitieumodel.iduser),
      trailing: Text(chitieumodel.chiphi),
    );
  }
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) => {
        Get.put(ChiTieuController()),
        Get.put(addTransactionController()),
      });
  ChiTieuController _chitieuController = Get.find();
  addTransactionController _addTransactionController = Get.find();
  await _addTransactionController.set('30000', '1');
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

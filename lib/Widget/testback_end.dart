import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/firebase/controller/controller.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';
import 'package:baitap/model/chi_tieu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestBackEnd extends GetView<ChiTieuController> {
  const TestBackEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: controller.allchiTieu.length,
        itemBuilder: (context, index) {
          return Testcard(chitieumodel: controller.allchiTieu[index]);
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
      title: Text(chitieumodel.id),
      subtitle: Text(chitieumodel.iduser),
      trailing: Text(chitieumodel.chiphi),
    );
  }
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) => {
        Get.put(ChiTieuController()),
        Get.put(ChiTieuController()),
        Get.put(addTransactionController()),
      });
  ChiTieuController _chitieuController = Get.find();
  addTransactionController _addTransactionController = Get.find();
  await _addTransactionController.set('60000', '1');
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

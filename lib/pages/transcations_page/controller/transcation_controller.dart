import 'package:baitap/firebase/controller/chitieu_controller.dart';
import 'package:baitap/model/kinds_of_transcations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baitap/firebase/controller/firebase_constant.dart';

import '../../../model/chi_tieu.dart';

import '../../../firebase/controller/controller.dart';

class TranscationsPageController extends GetxController {
  TextEditingController textController = TextEditingController(text: '0');
  var listKindsofTrans = <KindOfTransactions>[].obs;
  var selectedValue = '1'.obs;
  var selectedDate = DateTime.now().obs;

  @override
  void onReady() {
    super.onReady();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1945),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Hãy chọn ngày',
      cancelText: 'Đóng',
      confirmText: 'Xác nhận',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  @override
  void onInit() {
    listKindsofTrans.addAll([
      KindOfTransactions(
          value: '1',
          image: Image.asset(
            'assets/icons/eat.png',
            width: 30,
            height: 30,
          ),
          text: 'Ăn uống'),
      KindOfTransactions(
          value: '2',
          image: Image.asset(
            'assets/icons/invoice.png',
            width: 30,
            height: 30,
          ),
          text: 'Hoá đơn Internet'),
      KindOfTransactions(
          value: '3',
          image: Image.asset(
            'assets/icons/rent.png',
            width: 30,
            height: 30,
          ),
          text: 'Hoá đơn thuê nhà'),
      KindOfTransactions(
          value: '4',
          image: Image.asset(
            'assets/icons/energy.png',
            width: 30,
            height: 30,
          ),
          text: 'Hoá đơn điện'),
      KindOfTransactions(
          value: '5',
          image: Image.asset(
            'assets/icons/faucet.png',
            width: 30,
            height: 30,
          ),
          text: 'Hoá đơn nước'),
      KindOfTransactions(
          value: '6',
          image: Image.asset(
            'assets/icons/question.png',
            width: 30,
            height: 30,
          ),
          text: 'Chi tiêu khác'),
    ]);
    // TODO: implement onInit
    super.onInit();
  }
late ChiTieu chiTieuModel;
  void addTrans() async {
    final user = await auth.currentUser!;
    final transcations =
        await firestore.collection('ChiTieu').doc(user.uid).set(
          {
            'ngaythang': chiTieuModel.ngaythang,
            'iduser': chiTieuModel.iduser,
            'idthang': chiTieuModel.idthang,
            'loai': chiTieuModel.loai,
            'chiphi': chiTieuModel.chiphi,
          }
        );
  }

  void onChanged(value) {
    selectedValue.value = value;
  }
}

class TranscationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TranscationsPageController());
    Get.lazyPut(() => addTransactionController());
    Get.lazyPut(()=>ChiTieuController());
    // TODO: implement dependencies
  }

}
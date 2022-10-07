import 'package:baitap/model/kinds_of_transcations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Hãy chọn ngày',
        cancelText: 'Đóng',
        confirmText: 'Xác nhận',
        fieldHintText: 'Month/Date/Year',);
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
            width: 24,
            height: 24,
          ),
          text: 'Ăn uống'),
      KindOfTransactions(
          value: '2',
          image: Image.asset(
            'assets/icons/invoice.png',
            width: 24,
            height: 24,
          ),
          text: 'Hoá đơn Internet'),
      KindOfTransactions(
          value: '3',
          image: Image.asset(
            'assets/icons/rent.png',
            width: 24,
            height: 24,
          ),
          text: 'Hoá đơn thuê nhà'),
      KindOfTransactions(
          value: '4',
          image: Image.asset(
            'assets/icons/energy.png',
            width: 24,
            height: 24,
          ),
          text: 'Hoá đơn điện'),
      KindOfTransactions(
          value: '5',
          image: Image.asset(
            'assets/icons/faucet.png',
            width: 24,
            height: 24,
          ),
          text: 'Hoá đơn nước'),
      KindOfTransactions(
          value: '6',
          image: Image.asset(
            'assets/icons/question.png',
            width: 24,
            height: 24,
          ),
          text: 'Chi tiêu khác'),
    ]);
    // TODO: implement onInit
    super.onInit();
  }

  void onChanged(value) {
    selectedValue.value = value;
  }
}
